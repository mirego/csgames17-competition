//
//  AppDelegate.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    private let serviceFactory = ServiceFactory()
    private var controllerFactory: ControllerFactory!
    private var viewControllerFactory: ViewControllerFactory!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        controllerFactory = ControllerFactory(serviceFactory: serviceFactory)
        viewControllerFactory = ViewControllerFactory(controllerFactory: controllerFactory)

        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .dustyOrange
        window!.backgroundColor = UIColor.black
        window!.rootViewController = UINavigationController(rootViewController: viewControllerFactory.homeViewController())
        window!.makeKeyAndVisible()

        return true
    }
}
