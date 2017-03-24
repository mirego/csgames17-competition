const express = require('express');
const _ = require('lodash');

const router = express.Router({
  mergeParams: true
});

/*
 * Get all the conversations concerning the current user
 */
router.get('/', function(req, res) {
  let userId = req.params.user_id;
  const filter = {
    'users': {
      $elemMatch: userId
    }
  };
  req.db.conversations.find(filter, function(e, conversations) {
    conversations = conversations.map((conversation) => ({
      '_id': conversation._id,
      'lastMessage': _.last(conversation.messages),
      'users': conversation.users
    }));
    returnConversationsWithUsers(req, res, conversations);
  });
});

/*
 * Create a new conversation
 */
router.post('/', function(req, res) {
  let userIds = req.body.users;

  if (userIds && userIds.length == 2 && _.indexOf(userIds, req.params.user_id) != -1) {
    const filter = {
      '_id': {
        $in: userIds
      }
    };
    req.db.users.find(filter, function(e, users) {
      if (users.length == 2) {
        const subfilter = {
          $and: [{
            'users': userIds[0]
          }, {
            'users': userIds[1]
          }]
        };
        req.db.conversations.findOne(subfilter, function(e, conversation) {
          if (!conversation) {
            let conversation = {
              'users': userIds,
              'messages': []
            }
            req.db.conversations.insert(conversation, function(e, conversation) {
              returnConversationsWithUsers(req, res, [conversation]);
            });
          } else {
            returnConversationsWithUsers(req, res, [conversation]);
          }
        });
      } else {
        res.status(422).send('Users not found for conversation');
      }
    });
  } else {
    res.status(422).send('Conversations must have 2 users, including the current user');
  }
});

/*
 * Get a specific conversation
 */
router.get('/:conversation_id', function(req, res) {
  const filter = {
    '_id': req.params.conversation_id,
    'users': {
      $elemMatch: req.params.user_id
    }
  };
  req.db.conversations.findOne(filter, function(e, conversation) {
    returnConversationsWithUsers(req, res, [conversation]);
  });
});

/*
 * Post a new message to the conversation
 */
router.post('/:conversation_id', function(req, res) {
  let message = req.body.message;

  if (message && message.length) {
    const filter = {
      '_id': req.params.conversation_id,
      'users': {
        $elemMatch: req.params.user_id
      }
    };
    req.db.conversations.findOne(filter, function(e, conversation) {
      conversation.messages.push({
        'userId': req.params.user_id,
        'message': message,
        'timestamp': (new Date()).toISOString()
      });
      req.db.conversations.update(filter, conversation, function() {
        returnConversationsWithUsers(req, res, [conversation]);
      });
    });
  } else {
    res.status(422).send('Message cannot be empty');
  }
});

var returnConversationsWithUsers = function(req, res, conversations) {
  const filter = {
    '_id': {
      $in: conversations.reduce((users, conversation) => _.union(users, conversation.users), [])
    }
  };
  const projection = {
    'password': 0
  };
  req.db.users.find(filter, projection, function(e, users) {
    res.json({
      'conversations': conversations,
      'users': users
    });
  });
}

module.exports = router;
