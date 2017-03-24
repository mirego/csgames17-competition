# CS Games 2017 - Mobile - iOS App

This project serves as a starting base for the CS Games 2017 Mobile Competition.

You may edit it as much as you like (or start completely from scratch if you prefer) – as long as you make something awesome!

## Prerequisites

Make sure you have the following software installed before beginning:

- Latest version of Xcode (8.2.1)
- Recent version of the iOS SDK (at least 10.0)

You can download these from the [Apple Developer website](https://developer.apple.com/downloads/).

> **NOTE:** You need a Mac computer running macOS 10.11.5 or later. If you don't have one, you may check our [Sample Android app](https://github.com/mirego/csgames-sample-android/), which can be run on Windows, Linux and older versions of macOS.

## Getting started

First, make sure you have cloned the project from Github:

```
git clone http://github.com/mirego/csgames17-competition.git
```

Navigate into this directory:

```
cd csgames17-competition/ios
```

This project uses [CocoaPods](https://cocoapods.org/) as a dependency manager. If you don't have it already, install it with the following command:

```
sudo gem install cocoapods
```

Then fetch dependencies and build the workspace:

```
pod install
```

When completed, the project should be ready to open:

```
open CSChat.xcworkspace
```

## Building the project

In Xcode, run the project by simply pressing the "Play" button on the top left, or by hitting `⌘R`.

<p align="center"><img width="397" src="https://cloud.githubusercontent.com/assets/4378424/13624346/1c8ac8c0-e57b-11e5-9a4d-af6d4a104255.png"></p>

Once the app opens up in the iOS Simulator, you are ready to start coding.

## How it works

**CSChat** is a small application inspired by [Facebook Messenger](https://www.messenger.com/) and [Slack](https://www.slack.com/). It is very basic however, as it can only send basic messages to single conversations.

It should be fairly straightforward to use and customize, but if you want to know more about it, you can read on.

> **NOTE:** Before you begin, make sure the web server is up and running (see the [server page](https://github.com/mirego/csgames17-competition/tree/master/server)).

### Views

The app contains two main view controllers:

- `MainViewController`: The **home screen**, with *login* and *registration*
- `MessagesViewController`: The **messaging screen**, with random text strings and a fixed image

You will customize mostly the latter, where you can add real messaging functionalities. You are free to change the project structure and add as many views as you want, but keep in mind that 3 hours go very fast.

### Libraries

As you will see from the `Podfile`, this project uses a couple of libraries:

#### Public libraries
- **[Alamofire](https://github.com/Alamofire/Alamofire)**: Simple HTTP networking, to easily send requests to the web server
- **[SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)**: Simple HUD controller, to display loading indicators and operation results
- **[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)**: Simple JSON-handler, to easily handle server responses

#### Mirego libraries
- **[MCUIColorUtils](https://github.com/mirego/MCUIColorUtils)**: Extension to UIColor, adding convenient methods for color management
- **[MCUIViewLayout](https://github.com/mirego/MCUIViewLayout)**: Extension to UIView, making manual view layouting easier
- **[MRGArchitect](https://github.com/mirego/MRGArchitect)**: Device-agnostic tool to load different values depending on the current screen size

These make up the project as it is, but you may add or remove pod dependencies as much as you like.

### Data Sources

The app contains two data sources:

- `UserApi`: For user login and registration
- `MessageApi`: For messages sent through the app

They offer very basic support for two routes available in the [server](https://github.com/mirego/csgames17-competition/tree/master/server). The data is not validated, except for the user login, where only existing users are authorized.

### Next steps

So, what's the room for improvement?

Here are some features you could add to this app:

- Rich text messages
- Real-time socketed messaging
- Group conversations
- Conversation messages paging
- Push notifications

The list is non-exhaustive, feel free to do anything you can think of!

## License

This competition is © 2017 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/csgames17-competition/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
