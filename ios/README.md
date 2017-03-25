# CS Games 2017 - Mobile - iOS App

This project serves as a starting base for the CS Games 2017 Mobile Competition.

You may edit it as much as you like (or start completely from scratch if you prefer) – as long as you make something awesome!

## Prerequisites

Make sure you have the following software installed before beginning:

- Latest version of Xcode (8.2.1)
- Recent version of the iOS SDK (at least 10.0)

You can download these from the [Apple Developer website](https://developer.apple.com/downloads/).

> **NOTE:** You need a Mac computer running macOS 10.11.5 or later. If you don't have one, go to our [Android app](https://github.com/mirego/csgames17-competition/tree/master/android), which can be run on Windows, Linux and older versions of macOS.

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

<p align="center"><img width="397" src="https://cloud.githubusercontent.com/assets/4378424/24324682/3c682b70-1161-11e7-9d87-373095c82ed7.jpg"></p>

Once the app opens up in the iOS Simulator, you are ready to start coding.

## How it works

**CSChat** is a small application inspired by [Facebook Messenger](https://www.messenger.com/) and [Slack](https://www.slack.com/). It is very basic however, as it can only send basic messages to single conversations.

It should be fairly straightforward to use and customize, but if you want to know more about it, you can read on.

> **NOTE:** Before you begin, make sure the web server is up and running (see the [server page](https://github.com/mirego/csgames17-competition/tree/master/server)).

## License

This competition is © 2017 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/csgames17-competition/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
