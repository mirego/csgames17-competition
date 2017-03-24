//
//  ConversationsViewController.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import Foundation

class ConversationsViewController: BaseViewController
{
    private var mainView: ConversationsView {
        return self.view as! ConversationsView
    }

    private let conversationsController: ConversationsController

    init(conversationsController: ConversationsController)
    {
        self.conversationsController = conversationsController

        super.init()
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView()
    {
        view = ConversationsView()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

        conversationsController.allConversations { (conversations) -> (Void) in
            if let conversations = conversations {
                print("Conversation received: \(conversations.count)")
                conversations.forEach {
                    print("\($0.name ?? "")")
                    print("\($0.message ?? "")")
                    print("\($0.date ?? "")")
                    print("\($0.avatarUrl ?? "")")
                }
            } else {
                print("Error!!")
            }
        }
    }
}
