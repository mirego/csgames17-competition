const express = require('express');
const nedb = require('nedb');
const bodyParser = require('body-parser');
const logger = require('morgan');
const path = require('path');


let app = express();
app.set('port', process.env.PORT || 3000);

let db = {};
db.users = new nedb({
  filename: 'data/users.db',
  autoload: true
});

db.conversations = new nedb({
  filename: 'data/conversations.db',
  autoload: true
});

app.use(function(req, res, next) {
  req.db = db;
  next();
});

app.use(bodyParser.json({
  limit: '10mb'
}));
app.use(bodyParser.urlencoded({
  extended: false,
  limit: '10mb'
}));

app.use(logger('dev'));

let login = require('./routes/login');
let usersRoute = require('./routes/users');
let conversations = require('./routes/conversations');
let messages = require('./routes/messages');

app.use('/login', login);

app.use('/users', usersRoute);
usersRoute.use('/:user_id/conversations', conversations);

app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: err
  });
});

var server = app.listen(app.get('port'), function() {
  console.log('Express server listening on localhost:' + server.address().port);
});

module.exports = app;
