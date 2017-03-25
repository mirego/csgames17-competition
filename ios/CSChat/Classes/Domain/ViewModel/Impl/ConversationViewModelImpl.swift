//
//  ConversationViewModelImpl.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class ConversationViewModelImpl: ConversationViewModel
{
    var name: String? {
        return user?.username
    }

    var message: String? {
        return conversationSummary.lastMessage?.message
    }

    var date: String? {
        return dateFormatter.shortFormat(dateString: conversationSummary.lastMessage?.timestamp)
    }

    var avatarUrl: String? {
        return user?.url
    }

    let conversationSummary: ConversationSummary
    let dateFormatter: MessageDateFormatter

    private let user: User?

    init(conversationSummary: ConversationSummary, users: [User], loggedUser: User, dateFormatter: MessageDateFormatter)
    {
        self.conversationSummary = conversationSummary
        self.dateFormatter = dateFormatter

        if let userIds = conversationSummary.userIds, let notLoggedUserId = (userIds.filter { $0 != loggedUser.id }).first {
            if let user = (users.filter { $0.id == notLoggedUserId }).first {
                self.user = user
            } else {
                self.user = nil
            }
        } else {
            self.user = nil
        }
    }
}
