//
//  TransitionViewController.swift
//  iHeart
//
//  Created by Hugo Lefrancois on 2016-01-14.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

class TransitionViewController: BaseViewController
{
    fileprivate var viewController: UIViewController

    fileprivate var mainView: TransitionView {
        get { return self.view as! TransitionView }
    }

    init(viewController: UIViewController)
    {
        self.viewController = viewController

        super.init()
        
        addChildViewController(viewController)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView()
    {
        view = TransitionView(contentView: viewController.view)
    }

    func transitionToViewController(_ viewController: UIViewController)
    {
        addChildViewController(viewController)

        self.viewController.willMove(toParentViewController: nil)
        mainView.transitionToView(viewController.view, completion: { () -> Void in
            viewController.didMove(toParentViewController: self)
            self.viewController.removeFromParentViewController()
            self.viewController = viewController
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }

    override var childViewControllerForStatusBarStyle: UIViewController?
    {
        // The current ViewController will determine the status bar style.
        return viewController
    }
}
