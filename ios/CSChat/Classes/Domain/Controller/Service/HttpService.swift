//
//  HttpService.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

protocol HttpService
{
    func login(username: String, password: String, completion: @escaping (_ success: Bool) -> (Void))
}
