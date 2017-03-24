//
//  User.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable
{
    var id: String? = nil
    var username: String? = nil
    var url: String? = nil

    init()
    {
    }

    required init?(map: Map)
    {
    }

    func mapping(map: Map)
    {
        id <- map["_id"]
        username <- map["username"]
        url <- map["url"]
    }
}
