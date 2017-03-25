//
//  BaseViewController.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

class BaseViewController: UIViewController
{
    var viewControllerFactory: ViewControllerFactory!

    fileprivate var loadingStartDate: Date?
    
    init()
    {
        super.init(nibName: nil, bundle: nil)

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont.latoRegular(17), NSForegroundColorAttributeName: UIColor.white], for: .normal)
        navigationItem.backBarButtonItem = backButton
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.latoBold(17), NSForegroundColorAttributeName: UIColor.white]
    }
}
