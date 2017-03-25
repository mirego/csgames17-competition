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
        mainView.delegate = self
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

extension MessagesViewController: MessagesViewDelegate
{
    func sendMessage(_ message: String)
    {
        mainView.showLoading(true)
        print("Sending: \(message)")
    }
}
