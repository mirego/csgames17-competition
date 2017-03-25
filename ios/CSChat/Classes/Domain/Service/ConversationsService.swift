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

    func allMessages(forConversationSummary conversationSummary: ConversationSummary, loggedUser: User, completion: @escaping (_ messageResponse: MessageResponse?) -> (Void))

    func sendMessage(message: String, conversationSummary: ConversationSummary, loggedUser: User, completion: @escaping (_ messageResponse: MessageResponse?) -> (Void))
}
