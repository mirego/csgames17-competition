//
//  NavigationController.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController
{
    override init(rootViewController: UIViewController)
    {
        super.init(rootViewController: rootViewController)

        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .dustyOrange
        navigationBar.backIndicatorImage = UIImage(named: "icnBack")?.withRenderingMode(.alwaysTemplate)
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icnBack")?.withRenderingMode(.alwaysTemplate)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
