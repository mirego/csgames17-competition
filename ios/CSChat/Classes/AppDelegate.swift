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

    fileprivate var transitionViewController: TransitionViewController!

    private let serviceFactory = ServiceFactory()
    private var controllerFactory: ControllerFactory!
    private var viewControllerFactory: ViewControllerFactory!

    private var loginController: LoginController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        controllerFactory = ControllerFactory(serviceFactory: serviceFactory)
        viewControllerFactory = ViewControllerFactory(controllerFactory: controllerFactory)

        loginController = controllerFactory.loginController()

        transitionViewController = TransitionViewController(viewController: UINavigationController(rootViewController: viewControllerFactory.homeViewController()))

        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .dustyOrange
        window!.backgroundColor = UIColor.black
        window!.rootViewController = transitionViewController
        window!.makeKeyAndVisible()

        _ = loginController?.isLoggedObservable.register(callback: { (_, isLoggedIn) in
            if isLoggedIn {
                self.transitionViewController.transitionToViewController(NavigationController(rootViewController: self.viewControllerFactory.conversationsViewController()))
            } else {
                self.transitionViewController.transitionToViewController(UINavigationController(rootViewController: self.viewControllerFactory.homeViewController()))
            }
        })
        return true
    }
}
