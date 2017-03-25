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
    fileprivate var mainView: MessagesView {
        return self.view as! MessagesView
    }

    fileprivate let conversationsController: ConversationsController
    fileprivate let conversationViewModel: ConversationViewModel

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
        mainView.delegate = self
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        conversationsController.allMessages(forConversation: conversationViewModel) { [weak self] (messages) -> (Void) in
            self?.processMessage(messages)
        }
    }

    fileprivate func processMessage(_ messages: [MessageViewModel]?)
    {
        if let messages = messages {
            mainView.configure(messages: messages)
        } else {
            mainView.configure(messages: [])
        }
    }
}

extension MessagesViewController: MessagesViewDelegate
{
    func sendMessage(_ message: String)
    {
        mainView.showLoading(true)
        conversationsController.sendMessage(message: message, conversationViewModel: conversationViewModel) { [weak self] (messages) -> (Void) in
            self?.mainView.showLoading(false)
            if messages != nil {
                self?.mainView.cleanMessage()
            }
            self?.processMessage(messages)
        }
    }
}
