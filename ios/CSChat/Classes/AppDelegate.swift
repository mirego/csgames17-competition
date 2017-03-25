//
//  AppDelegate.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    private let serviceFactory = ServiceFactory()
    private var controllerFactory: ControllerFactory!
    private var viewControllerFactory: ViewControllerFactory!

    private var loginController: LoginController?

    private var isLoggedIn = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        controllerFactory = ControllerFactory(serviceFactory: serviceFactory)
        viewControllerFactory = ViewControllerFactory(controllerFactory: controllerFactory)

        loginController = controllerFactory.loginController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .white
        window!.backgroundColor = UIColor.black
        window!.rootViewController = UINavigationController(rootViewController: viewControllerFactory.homeViewController())
        window!.makeKeyAndVisible()

        _ = loginController?.isLoggedObservable.register(callback: { (_, isLoggedIn) in
            if isLoggedIn && !self.isLoggedIn {
                self.isLoggedIn = true
                let conversationViewController = NavigationController(rootViewController: self.viewControllerFactory.conversationsViewController())
                conversationViewController.modalTransitionStyle = .crossDissolve
                self.window!.rootViewController?.present(conversationViewController, animated: true) {
                    _ = (self.window!.rootViewController as? UINavigationController)?.popToRootViewController(animated: false)
                }
            } else if self.isLoggedIn {
                self.isLoggedIn = false
                self.window!.rootViewController?.dismiss(animated: true, completion: nil)
            }
        })
        return true
    }
}
