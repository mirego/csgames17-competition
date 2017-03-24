//
//  ConversationSummary.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import ObjectMapper

class ConversationSummary: Mappable
{
    var id: String? = nil
    var lastMessage: Message? = nil
    var userIds: [String]?

    required init?(map: Map)
    {
    }

    func mapping(map: Map)
    {
        id <- map["_id"]
        lastMessage <- map["lastMessage"]
        userIds <- map["users"]
    }
}
