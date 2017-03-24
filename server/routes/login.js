const express = require('express');
const router = express.Router();

router.post('/', function(req, res) {
  let collection = req.db.users;
  let username = req.body.username.toLowerCase();
  collection.findOne({
    "username": username
  }, {}, function(err, doc) {
    if (doc == null) {
      res.status(404) // HTTP status 404: NotFound
      res.send('Not found');
    } else {
      console.log(doc);
      res.json(doc);
    }
  });
});

module.exports = router;
