//
//  LoginControllerImpl.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class LoginControllerImpl: LoginController
{
    private let loginService: LoginService

    var isLoggedObservable: Observable<Bool> {
        return loginService.isLoggedObservable
    }

    init(loginService: LoginService)
    {
        self.loginService = loginService
    }

    func login(username: String, password: String, completion: @escaping (_ success: Bool) -> (Void))
    {
        loginService.login(username: username, password: password) { (user) -> (Void) in
            completion(user != nil)
        }
    }
}
