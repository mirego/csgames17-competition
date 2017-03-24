//
//  LoginController.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

protocol LoginController
{
    var isLoggedObservable: Observable<Bool> { get }

    func login(username: String, password: String, completion: @escaping (_ success: Bool) -> (Void))
}
