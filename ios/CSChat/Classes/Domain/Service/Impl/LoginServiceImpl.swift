//
//  LoginServiceImpl.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class LoginServiceImpl: LoginService
{
    var loggedUser: User?

    var isLoggedObservable: Observable<Bool> = Observable<Bool>()

    func login(username: String, password: String, completion: @escaping (_ user: User?) -> (Void))
    {
        let url = HttpConst.baseUrl + "login"
        let parameters: [String: Any] = ["username": username, "password": password]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseObject { (response: DataResponse<User>) in
            if let statusCode = response.response?.statusCode {
                if (statusCode >= 200 && statusCode < 300) {
                    self.loggedUser = response.result.value
                    self.isLoggedObservable.notify(data: true)
                    completion(response.result.value)
                } else {
                    self.isLoggedObservable.notify(data: false)
                    completion(nil)
                }
            } else {
                self.isLoggedObservable.notify(data: false)
                completion(nil)
            }
        }
    }

    func logout()
    {
        loggedUser = nil
        isLoggedObservable.notify(data: false)
    }
}
