# CS Games 2017 - Mobile - Android App

This project serves as a starting base for the CS Games 2017 Mobile Competition.

You may edit it as much as you like (or start completely from scratch if you prefer) – as long as you make something awesome!

## Prerequisites

Make sure you have the following software installed before beginning:

- Latest version of Android Studio (2.3)
- Recent version of the Android SDK (at least API 23)

You can download these from the [Android Developer website](http://developer.android.com/sdk/index.html).

> **NOTE:** If you have a Mac computer running macOS 10.11.5 or later, you may also be interested in our [iOS app](https://github.com/mirego/csgames17-competition/tree/master/ios), which uses Xcode and the latest iOS SDK.

## Getting started

First, make sure you have cloned the project from Github:

```
git clone http://github.com/mirego/csgames17-competition.git
```

Then, in Android Studio: 

- Select **Import project (Eclipse, ADT, Gradle, etc.)** in the Welcome Screen, go find the `android` folder in the repository you just cloned, and click **OK**.
- Once the project is open, click on **Sync Project with Gradle Files** in the main toolbar (or navigate to `Tools -> Android` in the application menu and select the same option).

<p align="center"><img src="https://cloud.githubusercontent.com/assets/4378424/24182187/64981e3e-0e96-11e7-8fcb-f03f14d78c59.png" width="208"></p>

Once you see a `BUILD SUCCESSFUL` notice in the Gradle Console, your environment should be ready to build and run the project.

### Web server

For the app to communicate with the local web server, you must set your local IP address in the project configuration file.

In `app/src/main/java/com/mirego/cschat/AndroidModule.java`:

- Change the value of the server URL in `provideRetrofit.baseUrl()` to the IP address of your computer on the local network (you cannot set `localhost` or `127.0.0.1` because it will use the loopback of the Android device).

## Building the project

The project should have already been configured as an Android project in Android Studio, therefore you should see a target named `app` in the main toolbar, with **Play** and **Debug** buttons on its right.

Press on the **Debug** icon, and if you don't already have one, [create a new Android Virtual Device](http://developer.android.com/tools/devices/managing-avds.html), then select it to run the project.

Once the app appears running in your Virtual Device, your environment is ready for the competition.

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
