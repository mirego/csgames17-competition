//
//  ConversationsView.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

protocol ConversationsViewDelegate: class
{
    func didTapConversation(conversation: ConversationViewModel)
}

class ConversationsView: UIView
{
    fileprivate var conversations: [ConversationViewModel] = []

    fileprivate let tableView = UITableView()

    weak var delegate: ConversationsViewDelegate?

    init()
    {
        super.init(frame: CGRect.zero)

        backgroundColor = .white

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(ConversationTableViewCell.self, forCellReuseIdentifier: ConversationTableViewCell.reuseIdentifier)
        addSubview(tableView)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        tableView.frame = bounds
    }

    func configure(conversations: [ConversationViewModel])
    {
        self.conversations = conversations

        tableView.reloadData()
    }
}

extension ConversationsView: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return conversations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let conversationCell = tableView.dequeueReusableCell(withIdentifier: ConversationTableViewCell.reuseIdentifier, for: indexPath) as! ConversationTableViewCell

        conversationCell.configure(conversation: conversations[indexPath.row])

        return conversationCell
    }
}

extension ConversationsView: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: false)

        if indexPath.row < conversations.count
        {
            delegate?.didTapConversation(conversation: conversations[indexPath.row])
        }
    }
}
