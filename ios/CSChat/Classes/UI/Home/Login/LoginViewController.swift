//
//  LoginViewController.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController
{
    fileprivate var mainView: LoginView {
        return self.view as! LoginView
    }

    fileprivate let loginController: LoginController

    init(loginController: LoginController)
    {
        self.loginController = loginController

        super.init()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView()
    {
        view = LoginView()
        mainView.delegate = self
    }

    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        mainView.focusUsername()
    }
}

extension LoginViewController: LoginViewDelegate
{
    func didTapContinue(username: String, password: String)
    {
        mainView.showLoading(true)

        loginController.login(username: username, password: password) { [weak self] (success) -> (Void) in
            guard let strongSelf = self else { return }
            if success {
                strongSelf.navigationController?.pushViewController(strongSelf.viewControllerFactory.conversationsViewController(), animated: true)
            } else {
                strongSelf.mainView.showLoading(false)
            }
        }
    }

    func didTapBack()
    {
        mainView.lockKeyboardOffset()
        _ = navigationController?.popViewController(animated: true)
    }
}
