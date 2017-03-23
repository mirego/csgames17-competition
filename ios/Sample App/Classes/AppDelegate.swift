//
//  AppDelegate.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var viewController: ViewController?
    
    let dataSource = DataSource()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        viewController = ViewController(dataSource: dataSource)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = UIColor.black
        window!.rootViewController = viewController!
        window!.makeKeyAndVisible()
        
        return true
    }
}
