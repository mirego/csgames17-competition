//
//  Conversation.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import ObjectMapper

class Conversation: Mappable
{
    var id: String! = nil
    var messages: [Message]? = nil
    var userIds: [String]?

    required init?(map: Map)
    {
    }

    func mapping(map: Map)
    {
        id <- map["_id"]
        messages <- map["messages"]
        userIds <- map["users"]
    }
}
