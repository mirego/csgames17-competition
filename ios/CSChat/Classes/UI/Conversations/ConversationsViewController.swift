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
        mainView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.layer.removeAllAnimations()

        conversationsController.allConversations { (conversations) -> (Void) in
            self.mainView.configure(conversations: conversations ?? [])
        }
    }
}

extension ConversationsViewController: ConversationsViewDelegate
{
    func didTapConversation(conversation: ConversationViewModel)
    {
        self.navigationController?.pushViewController(self.viewControllerFactory.messagesViewController(conversationViewModel: conversation), animated: true)
    }
}
