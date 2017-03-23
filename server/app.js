/***********
 * Imports *
 ***********/
 
// Web server
var express = require('express');

// Database
var nedb = require('nedb');

// Request helpers
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var favicon = require('serve-favicon');

// Tools
var logger = require('morgan');
var path = require('path');

/********************
 * Setup the server *
 ********************/

// Setup routes
var routes = require('./routes/index');
var messages = require('./routes/messages');
var users = require('./routes/users');

// Setup express server
var app = express();
app.set('port', process.env.PORT || 3000);
app.use(express.static(path.join(__dirname, 'public')));

// Configure database collections
var db = {};
db.messages = new nedb({ filename: 'data/messages.db', autoload: true });
db.users = new nedb({ filename: 'data/users.db', autoload: true });

// Forward the database to the router
app.use(function(req, res, next) {
  req.db = db;
  next();
});

/************************
 * Configure the server *
 ************************/

// Setup view engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// Setup helpers
app.use(bodyParser.json({ limit: '10mb' }));
app.use(bodyParser.urlencoded({ extended: false, limit: '10mb' }));
app.use(cookieParser());
app.use(favicon(__dirname + '/public/favicon.ico'));

// Setup tools
app.use(logger('dev'));

// Setup routes
app.use('/', routes);
app.use('/messages', messages);
app.use('/users', users);

/// Catch 404 errors
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

/// Setup debugging (print stacktrace)
app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
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
