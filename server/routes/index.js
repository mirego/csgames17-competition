var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', {
    title: 'CS Games 2016 - Mobile - Server'
  });
});

module.exports = router;
