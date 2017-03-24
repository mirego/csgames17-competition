//
//  ConversationsService.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

protocol ConversationsService
{
    func allConversations(loggedUser: User, completion: @escaping (_ conversationResponse: ConversationResponse?) -> (Void))
}
