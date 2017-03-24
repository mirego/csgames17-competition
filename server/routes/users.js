const express = require('express');
const router = express.Router();

/*
 * GET all users
 */
router.get('/', function(req, res) {
  const userCollection = req.db.users;
  const filter = req.query.name ? {
    "name": req.query.name
  } : {};
  userCollection.find(filter, {}, function(e, docs) {
    res.json(docs);
  });
});

/*
 * GET a user
 */
router.get('/:id', function(req, res) {
  const userCollection = req.db.users;
  const userId = req.params.id;
  userCollection.findOne({
    "_id": userId
  }, {}, function(err, doc) {
    if (doc == null) {
      res.status(404) // HTTP status 404: NotFound
      res.send('Not found');
    } else {
      res.json(doc);
    }
  });
});

/*
 * Create new user
 */
router.post('/', function(req, res) {
  const userCollection = req.db.users;
  userCollection.insert(req.body, function(err, result) {
    res.send(
      (err === null) ? result : {
        msg: err
      }
    );
  });
});

/*
 * Delete user
 */
router.delete('/:id', function(req, res) {
  const userCollection = req.db.users;
  const userToDelete = req.params.id;
  userCollection.remove({
    '_id': userToDelete
  }, function(err) {
    res.send((err === null) ? {
      msg: ''
    } : {
      msg: 'error: ' + err
    });
  });
});

module.exports = router;
