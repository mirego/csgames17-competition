
exports.login = function (req, res) {
  let filter = {
    'username': req.body.username.toLowerCase(),
    'password': req.body.password
  };
  let projection = {
    password: 0
  };
  req.db.users.findOne(filter, projection, function (e, user) {
    if (user) {
      res.json(user);
    } else {
      res.status(401).send('Username or password invalid');
    }
  });
};
