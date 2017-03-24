const express = require('express');
const router = express.Router();

router.get('/', function(req, res) {
  let collection = req.db.conversations;
  console.log();
  collection.find({}, {}, function(e, docs) {
    res.json(docs);
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
