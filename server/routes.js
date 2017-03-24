const users = require('./controllers/users');
const auth = require('./controllers/auth');
const conversations = require('./controllers/conversations');

module.exports = function (app) {
  app.post('/api/login', auth.login);

  app.get('/api/users', users.list);
  app.get('/api/users/:user_id', users.getById);
  app.post('/api/users', users.register);

  app.get('/api/users/:user_id/conversations', conversations.list);
  app.get('/api/users/:user_id/conversations/:conversation_id', conversations.getById);
  app.post('/api/users/:user_id/conversations', conversations.create);
  app.post('/api/users/:user_id/conversations/:conversation_id', conversations.addMessage)
};
