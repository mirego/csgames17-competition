//
//  ConversationsController.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

protocol ConversationsController
{
    func allConversations(completion: @escaping (_ conversations: [ConversationViewModel]?) -> (Void))
}
