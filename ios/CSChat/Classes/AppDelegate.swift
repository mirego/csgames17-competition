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

    fileprivate var transitionViewController: TransitionViewController!

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

        transitionViewController = TransitionViewController(viewController: UINavigationController(rootViewController: viewControllerFactory.homeViewController()))

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .white
        window!.backgroundColor = UIColor.black
        window!.rootViewController = transitionViewController
        window!.makeKeyAndVisible()

        _ = loginController?.isLoggedObservable.register(callback: { (_, isLoggedIn) in
            if isLoggedIn && !self.isLoggedIn {
                self.isLoggedIn = true
                self.transitionViewController.transitionToViewController(NavigationController(rootViewController: self.viewControllerFactory.conversationsViewController()))
            } else if self.isLoggedIn {
                self.isLoggedIn = false
                self.transitionViewController.transitionToViewController(UINavigationController(rootViewController: self.viewControllerFactory.homeViewController()))
            }
        })
        return true
    }
}
