const express = require('express');
const nedb = require('nedb');
const bodyParser = require('body-parser');
const logger = require('morgan');
const path = require('path');

/********************
 * Setup the server *
 ********************/

let app = express();

app.set('port', process.env.PORT || 3000);

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
app.use(function (req, res, next) {
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
const routes = require('./routes')(app);

/// Catch 404 errors
app.use(function (req, res, next) {
  res.status(404).send('Route not found');
});

/// Setup debugging (print stack trace)
app.use(function (err, req, res, next) {
  res.status(err.status || 500).json({
    message: err.message,
    error: err
  });
});

/********************
 * Start the server *
 ********************/

const server = app.listen(app.get('port'), function () {
  console.log('Express server listening on localhost:' + server.address().port);
});

module.exports = app;
