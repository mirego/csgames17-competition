const bcrypt = require('bcryptjs');

exports.login = function (req, res) {
  let filter = {
    'username': req.body.username.toLowerCase()
  };

  let projection = {};

  req.db.users.findOne(filter, projection, function (e, user) {
    if (user && bcrypt.compareSync(req.body.password, user.password)) {
      delete user.password;
      res.json(user);
    } else {
      res.status(401).send('Username or password invalid');
    }
  });
};
