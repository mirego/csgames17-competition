# CS Games - Sample Android App

This project will guide you setting up your environment to build and run a sample Android application on your local machine.

## Prerequisites

Make sure you have the following software installed before beginning:

- Latest version of Android Studio (2.3)
- Recent version of the Android SDK (at least API 23)

You can download these from the [Android Developer website](http://developer.android.com/sdk/index.html).

> **NOTE:** If you have a Mac computer running macOS 10.11.5 or later, you may also be interested in our [Sample iOS app](https://github.com/mirego/csgames-sample-ios/), which uses Xcode and the latest iOS SDK.

## Getting started

First, clone the project from Github:

```
git clone git@github.com:mirego/csgames-sample-android.git
```

Then, in Android Studio: 

- Select **Import project (Eclipse, ADT, Gradle, etc.)** in the Welcome Screen, go find the repository you just cloned, and click **OK**.
- Once the project is open, click on **Sync Project with Gradle Files** in the main toolbar (or navigate to `Tools -> Android` in the application menu and select the same option).

<p align="center"><img src="https://cloud.githubusercontent.com/assets/4378424/24182187/64981e3e-0e96-11e7-8fcb-f03f14d78c59.png" width="208"></p>

Once you see a `BUILD SUCCESSFUL` notice in the Gradle Console, your environment should be ready to build and run the project.

## Building the project

The project should have already been configured as an Android project in Android Studio, therefore you should see a target named `app` in the main toolbar, with **Play** and **Debug** buttons on its right.

Press on the **Debug** icon, and if you don't already have one, [create a new Android Virtual Device](https://developer.android.com/studio/run/managing-avds.html), then select it to run the project.

Once the app appears running in your Virtual Device, your environment is ready for the competition.

## Support

If you have questions about the project or encounter any problem while configuring your environment, please don't hesistate to contact the [project author](https://github.com/ebelair) or submit an [issue](https://github.com/mirego/csgames-sample-android/issues).

## License

This sample app is © 2016 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/csgames-sample-android/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
