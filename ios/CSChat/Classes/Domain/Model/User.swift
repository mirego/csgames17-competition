//
//  User.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable, Equatable
{
    var id: String! = nil
    var username: String! = nil
    var url: String? = nil

    required init?(map: Map)
    {
    }

    func mapping(map: Map)
    {
        id <- map["_id"]
        username <- map["username"]
        url <- map["url"]
    }

    public static func ==(lhs: User, rhs: User) -> Bool
    {
        return lhs.id == rhs.id
    }
}
