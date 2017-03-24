//
//  Message.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import ObjectMapper

class Message: Mappable
{
    var userId: String? = nil
    var message: String? = nil
    var timestamp: String? = nil

    required init?(map: Map)
    {
    }

    func mapping(map: Map)
    {
        userId <- map["userId"]
        message <- map["message"]
        timestamp <- map["timestamp"]
    }
}
