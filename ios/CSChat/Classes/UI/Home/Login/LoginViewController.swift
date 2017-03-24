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
    private var mainView: LoginView {
        return self.view as! LoginView
    }

    override func loadView()
    {
        view = LoginView()
        mainView.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        mainView.endEditing(true)
    }
}

extension LoginViewController: LoginViewDelegate
{
    func didTapContinue()
    {

    }

    func didTapBack()
    {
        _ = navigationController?.popViewController(animated: true)
    }
}
