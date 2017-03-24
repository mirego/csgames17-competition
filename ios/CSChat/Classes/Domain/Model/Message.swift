//
//  Message.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import Foundation

class Message
{
    var messageId: String?
    var userId: String?
    var text: String?
    
    class func createMessage(messageId: String?, userId: String?, text: String?) -> Message
    {
        let message = Message()
        message.messageId = messageId
        message.userId = userId
        message.text = text
        
        return message
    }
    
    func toDictionary() -> [String : String]
    {
        var dictionary: [String : String] = [:]
        if let messageId = messageId {
            dictionary["_id"] = messageId
        }
        if let userId = userId {
            dictionary["userId"] = userId
        }
        if let text = text {
            dictionary["text"] = text
        }
        
        return dictionary
    }
}

extension Message: CustomDebugStringConvertible
{
    var debugDescription: String {
        get {
            var debugString = ""
            if let messageId = messageId {
                debugString += "ID: \(messageId) "
            }
            if let userId = userId {
                debugString += "User ID: \(userId) "
            }
            if let text = text {
                debugString += "Text: \(text) "
            }
            return debugString
        }
    }
}
