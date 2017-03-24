//
//  MessageResponse.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import ObjectMapper

class MessageResponse: Mappable
{
    var conversations: [Conversation]? = nil
    var users: [User]? = nil

    required init?(map: Map)
    {
    }

    func mapping(map: Map)
    {
        conversations <- map["conversations"]
        users <- map["users"]
    }
}
