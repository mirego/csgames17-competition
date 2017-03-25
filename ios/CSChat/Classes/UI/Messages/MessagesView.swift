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

    private let sendMessageBarView = SendMessageBarView()

    fileprivate var keyboardHeight = 0.f

    init()
    {
        super.init(frame: CGRect.zero)

        backgroundColor = .white

        _ = sendMessageBarView.sendButton.on(.touchUpInside) { [weak self] (_) in
            self?.sendMessage()
        }

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
    }

    fileprivate func sendMessage()
    {
        guard let message = sendMessageBarView.textField.text else { return }

        delegate?.sendMessage(message)
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
                self?.layoutSubviews()
            }, completion: nil)
        }
    }

    func keyboardWillHide(_ notification: Notification)
    {
        BRYParseKeyboardNotification(notification) { [weak self] (duration, _, options) -> Void in
            self?.keyboardHeight = 0
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
                self?.layoutSubviews()
            }, completion: nil)
        }
    }
}
