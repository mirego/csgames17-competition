const _ = require('lodash');

exports.list = function (req, res) {
  let userId = req.params.user_id;
  const filter = {
    'users': {
      $elemMatch: userId
    }
  };
  req.db.conversations.find(filter, function (e, conversations) {
    conversations = conversations.map((conversation) => ({
          '_id': conversation._id,
          'lastMessage': _.last(conversation.messages),
          'users': conversation.users
        })
    ).sort(function (conv1, conv2) {
      return Date.parse(conv2.lastMessage.timestamp) - Date.parse(conv1.lastMessage.timestamp);
    });

    returnConversationsBetweenUsers(req, res, conversations);
  });
};

exports.getById = function (req, res) {
  const filter = {
    '_id': req.params.conversation_id,
    'users': {
      $elemMatch: req.params.user_id
    }
  };
  req.db.conversations.findOne(filter, function (e, conversation) {
    returnConversationsBetweenUsers(req, res, [conversation]);
  });
};

exports.create = function (req, res) {
  let userIds = req.body.users;

  if (currentUserCreatesAConversationWithSomeoneElse(userIds, req)) {
    const filter = {
      '_id': {
        $in: userIds
      }
    };
    req.db.users.find(filter, function (e, users) {
      if (users.length === 2) {
        const subfilter = {
          $and: [{
            'users': userIds[0]
          }, {
            'users': userIds[1]
          }]
        };
        req.db.conversations.findOne(subfilter, function (e, conversation) {
          if (!conversation) {
            let conversation = {
              'users': userIds,
              'messages': []
            };
            req.db.conversations.insert(conversation, function (e, conversation) {
              returnConversationsBetweenUsers(req, res, [conversation]);
            });
          } else {
            returnConversationsBetweenUsers(req, res, [conversation]);
          }
        });
      } else {
        res.status(404).send('Users not found for conversation');
      }
    });
  } else {
    res.status(400).send('Conversations must have 2 users, including the current user');
  }
};

exports.addMessage = function (req, res) {
  let message = req.body.message;

  if (message && message.length) {
    const filter = {
      '_id': req.params.conversation_id,
      'users': {
        $elemMatch: req.params.user_id
      }
    };
    req.db.conversations.findOne(filter, function (e, conversation) {
      conversation.messages.push({
        'userId': req.params.user_id,
        'message': message,
        'timestamp': (new Date()).toISOString()
      });
      req.db.conversations.update(filter, conversation, function () {
        returnConversationsBetweenUsers(req, res, [conversation]);
      });
    });
  } else {
    res.status(400).send('Message cannot be empty');
  }
};

const returnConversationsBetweenUsers = function (req, res, conversations) {
  const filter = {
    '_id': {
      $in: conversations.reduce((users, conversation) => _.union(users, conversation.users), [])
    }
  };
  const projection = {
    'password': 0
  };
  req.db.users.find(filter, projection, function (e, users) {
    res.json({
      'conversations': conversations,
      'users': users
    });
  });

  function currentUserCreatesAConversationWithSomeoneElse(userIds, req) {
    return userIds && userIds.length === 2 && userIds.includes(req.params.user_id);
  }
};
