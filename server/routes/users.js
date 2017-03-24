const express = require('express');

const router = express.Router({
  mergeParams: true
});

/*
 * List all users
 */
router.get('/', function(req, res) {
  let filter = {};
  let projection = {
    password: 0
  };
  req.db.users.find(filter, projection, function(e, users) {
    res.json(users);
  });
});

/*
 * Get a specific user
 */
router.get('/:id', function(req, res) {
  let filter = {
    '_id': req.params.id
  };
  let projection = {
    'password': 0
  };
  req.db.users.findOne(filter, projection, function(e, user) {
    if (user) {
      res.json(user);
    } else {
      res.status(404).send('User not found');
    }
  });
});

/*
 * Create new user
 */
router.post('/', function(req, res) {
  if (req.body.username && req.body.password) {
    let user = {
      'username': req.body.username,
      'password': req.body.password,
      'url': req.body.url || ''
    };
    req.db.users.insert(user, function(e, user) {
      delete user.password;
      res.json(user);
    });
  } else {
    res.status(422).send('Missing required fields');
  }
});

module.exports = router;
