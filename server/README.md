# CS Games 2016 - Mobile - Server

This web server can be used to fetch and store data from the mobile application. It is built in **JavaScript** and uses an embedded datastore.

## Prerequisites

This project requires **Node.js**. If you don't have it, you can simply visit [https://nodejs.org/](https://nodejs.org/), download the latest version, and follow the setup instructions.

Once installed, you can validate its presence by running these commands:

```
node --version
npm --version
```

If one of them doesn't work, you may simply download the binaries from the [Node.js downloads page](https://nodejs.org/en/download/) and put them in this directory.

## Getting started

The server has been built to be very easy to use. First, install the dependencies:

```
npm install
```

And that's it, you're done.

You can start the server by running:

```
npm start
```

The server should be accessible at [http://localhost:3000/]([http://localhost:3000/]).

## How it works

The server works as a simple REST API. It should be fairly straightforward, but if you want to know more about it, you can read on.

### Objects

Two types of objects are currently supported, with their own route:

- `/messages`: Exchanges between users
- `/users`: User basic information

They both support basic HTTP operations (`GET`, `POST`, `PUT`, `DELETE`), but you can send any data in there – the request body is simply saved to the database as it is received.

There is no authentication or any data validation whatsoever, but this is enough to support the sample mobile applications.

Depending on your solution, you may want to expand it and add new features, but you may also keep it as is and focus on the mobile application.

### Database

To simplify development and deployment, the project uses [NeDB](https://github.com/louischatriot/nedb), an embedded datastore that works automatically, without a binary. It is built using a subset of the MongoDB API, so it's very easy to use.

Each collection of documents is represented in its own instance of NeDB, and is persisted using a simple file that contains JSON objects.

### Web front-end

The web front-end on [http://localhost:3000/](http://localhost:3000/) simply shows the currently persisted data, to help you explore the project at the beginning. You don't need to edit anything in there, unless it can help you debug your project.

### Next steps

So, what's the room for improvement?

Here are some features you could add to this server:

- User registration and authentication
- Associated users and messages
- Request data security
- Request data validation
- Persisted data encryption
- Persisted data compression
- Socket communication for real-time messaging
- Video stream support

The list is non-exhaustive, feel free to do anything you can think of!

## License

This competition is © 2016 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/csgames16-competition/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.