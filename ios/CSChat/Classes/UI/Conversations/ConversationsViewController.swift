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
    private let loginController: LoginController

    init(conversationsController: ConversationsController, loginController: LoginController)
    {
        self.conversationsController = conversationsController
        self.loginController = loginController

        super.init()

        title = LocalizedString("CONVERSATIONS_TITLE")

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "btnLogout"), style: .plain) { [weak self] _ in
            self?.loginController.logout()
        }
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

                delay(2, closure: { 
                    self.navigationController?.pushViewController(self.viewControllerFactory.messagesViewController(conversationViewModel: conversations[0]), animated: true)
                })
            } else {
                print("Error!!")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.layer.removeAllAnimations()
    }
}
