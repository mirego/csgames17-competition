//
//  MessagesViewController.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class MessagesViewController: BaseViewController
{
    private var mainView: MessagesView {
        return self.view as! MessagesView
    }

    private let conversationsController: ConversationsController
    private let conversationViewModel: ConversationViewModel

    init(conversationsController: ConversationsController, conversationViewModel: ConversationViewModel)
    {
        self.conversationsController = conversationsController
        self.conversationViewModel = conversationViewModel

        super.init()

        title = conversationViewModel.name
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView()
    {
        view = MessagesView()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        conversationsController.allMessages(forConversation: conversationViewModel) { (messages) -> (Void) in
            if let messages = messages {
                print("messages received: \(messages.count)")
            } else {
                print("nil messages received!!")
            }
        }
    }
}
