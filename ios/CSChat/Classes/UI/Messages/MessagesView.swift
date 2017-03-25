//
//  MessagesView.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import BRYParseKeyboardNotification

protocol MessagesViewDelegate: class
{
    func sendMessage(_ message: String)
}

class MessagesView: UIView
{
    weak var delegate: MessagesViewDelegate?

    fileprivate let tableView = UITableView()
    private let sendMessageBarView = SendMessageBarView()

    fileprivate var keyboardHeight = 0.f

    fileprivate var messages: [MessageViewModel] = []
    fileprivate let cellForHeight = MessageTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: MessageTableViewCell.reuseIdentifier)

    init()
    {
        super.init(frame: CGRect.zero)

        backgroundColor = .white

        _ = sendMessageBarView.sendButton.on(.touchUpInside) { [weak self] (_) in
            self?.sendMessage()
        }

        tableView.contentInset = .top(Stylesheet.spacing / 2)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.reuseIdentifier)
        addSubview(tableView)

        sendMessageBarView.textField.delegate = self
        addSubview(sendMessageBarView)

        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        sendMessageBarView.setPosition(.positionBottomLeft, margins: .bottom(keyboardHeight), size: CGSize(width: width, height: sendMessageBarView.height))

        tableView.setPosition(.positionTopLeft, margins: .top(0), size: CGSize(width: width, height: height - keyboardHeight - sendMessageBarView.height))
    }

    fileprivate func sendMessage()
    {
        guard let message = sendMessageBarView.textField.text else { return }

        delegate?.sendMessage(message)
    }

    func configure(messages: [MessageViewModel])
    {
        self.messages = messages
        tableView.reloadData()
        scrollToBottom()
    }

    func scrollToBottom()
    {
        tableView.setContentOffset(CGPoint(x: 0, y: tableView.contentInset.bottom + max(-tableView.contentInset.top, tableView.contentSize.height - tableView.height)), animated: false)
    }

    func showLoading(_ loading: Bool)
    {
        sendMessageBarView.showLoading(loading)
    }

    func cleanMessage()
    {
        sendMessageBarView.textField.text = ""
        sendMessageBarView.showLoading(false)
    }
}

extension MessagesView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        sendMessage()

        return true
    }
}

extension MessagesView
{
    func keyboardWillShow(_ notification: Notification)
    {
        BRYParseKeyboardNotification(notification) { [weak self] (duration, keyboardHeight, options) -> Void in
            self?.keyboardHeight = keyboardHeight

            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
                self?.setNeedsLayout()
                self?.layoutIfNeeded()

                self?.scrollToBottom()
            }, completion: nil)
        }
    }

    func keyboardWillHide(_ notification: Notification)
    {
        BRYParseKeyboardNotification(notification) { [weak self] (duration, _, options) -> Void in
            self?.keyboardHeight = 0

            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
                self?.setNeedsLayout()
                self?.layoutIfNeeded()

                self?.scrollToBottom()
            }, completion: nil)
        }
    }
}

extension MessagesView: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return cellForHeight.height(forMessage: messages[indexPath.row], inWidth: width)
    }
}

extension MessagesView: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let messageCell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.reuseIdentifier, for: indexPath) as! MessageTableViewCell
        messageCell.configure(message: messages[indexPath.row])

        return messageCell
    }
}
