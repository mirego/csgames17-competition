const express = require('express');
const _ = require('lodash');
var util = require('util');

const router = express.Router({
  mergeParams: true
});

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

    req.db.users.find({
      '_id': {
        $in: conversations.reduce((users, conversation) => _.union(users, conversation.users), [])
      }
    }, function(e, users) {
      res.json({
        'conversations': conversations,
        'users': users
      });
    });
  });
});

router.get('/:conversation_id', function(req, res) {
  const filter = {
    '_id': req.params.conversation_id,
    'users': {
      $elemMatch: req.params.user_id
    }
  };
  req.db.conversations.find(filter, function(e, conversations) {
    req.db.users.find({
      '_id': {
        $in: conversations.reduce((users, conversation) => _.union(users, conversation.users), [])
      }
    }, function(e, users) {
      res.json({
        'conversations': conversations,
        'users': users
      });
    });
  });
});

router.post('/', function(req, res) {
  let collection = req.db.conversations;
  collection.insert(req.body, function(err, result) {
    res.send(
      (err === null) ? result : {
        msg: err
      }
    );
  });
});

module.exports = router;
