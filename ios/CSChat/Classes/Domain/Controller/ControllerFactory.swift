//
//  ControllerFactory.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class ControllerFactory
{
    func loginController() -> LoginController
    {
        return LoginControllerImpl()
    }
}
