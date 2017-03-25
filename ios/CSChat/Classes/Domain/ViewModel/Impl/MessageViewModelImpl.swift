//
//  MessageViewModelImpl.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class MessageViewModelImpl: MessageViewModel
{
    var name: String? {
        return user?.username
    }

    var message: String? {
        return messageObject.message
    }

    var date: String? {
        return dateFormatter.mediumFormat(dateString: messageObject.timestamp)
    }

    var avatarUrl: String? {
        return user?.url
    }

    private let messageObject: Message
    private let dateFormatter: MessageDateFormatter
    private let user: User?

    init(message: Message, users: [User], dateFormatter: MessageDateFormatter)
    {
        self.messageObject = message
        self.dateFormatter = dateFormatter
        self.user = (users.filter { $0.id == message.userId }).first
    }
}
