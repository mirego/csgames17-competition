//
//  User.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

class User
{
    var userId: String?
    var name: String?
    var email: String?
    
    class func createUser(userId: String?, name: String?, email: String?) -> User
    {
        let user = User()
        user.userId = userId
        user.name = name
        user.email = email
        
        return user
    }
    
    func toDictionary() -> [String : String]
    {
        var dictionary: [String : String] = [:]
        if let userId = userId {
            dictionary["_id"] = userId
        }
        if let name = name {
            dictionary["name"] = name
        }
        if let email = email {
            dictionary["email"] = email
        }
        
        return dictionary
    }
}

extension User: CustomDebugStringConvertible
{
    var debugDescription: String {
        get {
            var debugString = ""
            if let userId = userId {
                debugString += "ID: \(userId) "
            }
            if let name = name {
                debugString += "Name: \(name) "
            }
            if let email = email {
                debugString += "Email: \(email) "
            }
            return debugString
        }
    }
}
