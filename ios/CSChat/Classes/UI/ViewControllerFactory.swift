//
//  ViewControllerFactory.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class ViewControllerFactory
{
    private let controllerFactory: ControllerFactory

    init(controllerFactory: ControllerFactory)
    {
        self.controllerFactory = controllerFactory
    }

    func homeViewController() -> UIViewController
    {
        return assign(HomeViewController())
    }

    func loginViewController() -> UIViewController
    {
        return assign(LoginViewController(loginController: controllerFactory.loginController()))
    }
}

// MARK Helpers
extension ViewControllerFactory
{
    fileprivate func assign<T: BaseViewController>(_ viewController: T) -> T
    {
        viewController.viewControllerFactory = self
        return viewController
    }
}
