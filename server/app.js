/***********
 * Imports *
 ***********/

// Web server
const express = require('express');

// Database
const nedb = require('nedb');

// Request helpers
const bodyParser = require('body-parser');

// Tools
const logger = require('morgan');
const path = require('path');

/********************
 * Setup the server *
 ********************/

// Setup express server
let app = express();
app.set('port', process.env.PORT || 3000);

// Configure database collections
let db = {};

db.conversations = new nedb({
  filename: 'data/conversations.db',
  autoload: true
});

db.users = new nedb({
  filename: 'data/users.db',
  autoload: true
});

// Forward the database to the router
app.use(function(req, res, next) {
  req.db = db;
  next();
});

/************************
 * Configure the server *
 ************************/

// Setup helpers
app.use(bodyParser.json({
  limit: '10mb'
}));
app.use(bodyParser.urlencoded({
  extended: false,
  limit: '10mb'
}));

// Setup tools
app.use(logger('dev'));

// Setup routes
let login = require('./routes/login');
let users = require('./routes/users');
let conversations = require('./routes/conversations');

// Bind routes
app.use('/login', login);
app.use('/users', users);
app.use('/users/:user_id/conversations', conversations);

/// Catch 404 errors
app.use(function(req, res, next) {
  res.status(404).send('Route not found');
});

/// Setup debugging (print stack trace)
app.use(function(err, req, res, next) {
  res.status(err.status || 500).json({
    message: err.message,
    error: err
  });
});

/********************
 * Start the server *
 ********************/

var server = app.listen(app.get('port'), function() {
  console.log('Express server listening on localhost:' + server.address().port);
});

module.exports = app;
