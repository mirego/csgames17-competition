//
//  LoginView.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import BRYParseKeyboardNotification

protocol LoginViewDelegate: class
{
    func didTapContinue()
    func didTapBack()
}

class LoginView: UIView
{
    weak var delegate: LoginViewDelegate?

    private let loginLabel = UILabel()

    fileprivate let username = TextField(hint: LocalizedString("LOGIN_USERNAME_HINT"))
    fileprivate let password = TextField(hint: LocalizedString("LOGIN_PASSWORD_HINT"))

    private let continueButton = GenericButton(title: LocalizedString("LOGIN_CONTINUE_BUTTON"), backgroundColor: .dustyOrange)
    private let backButton = TextButton(title: LocalizedString("LOGIN_BACK_BUTTON"))

    fileprivate var keyboardHeight = 0.f

    init()
    {
        super.init(frame: CGRect.zero)

        backgroundColor = .white

        loginLabel.setProperties(text: LocalizedString("LOGIN_TITLE"), font: .latoMedium(30), textColor: .black, fit: true)
        addSubview(loginLabel)

        username.textField.delegate = self
        username.textField.autocapitalizationType = .none
        username.textField.autocorrectionType = .no
        username.textField.returnKeyType = .next
        addSubview(username)

        password.textField.delegate = self
        password.textField.returnKeyType = .go
        password.textField.isSecureTextEntry = true
        addSubview(password)

        _ = continueButton.on(.touchUpInside) { [weak self] (_) in
            self?.delegate?.didTapContinue()
        }
        addSubview(continueButton)

        _ = backButton.on(.touchUpInside) { [weak self] (_) in
            self?.delegate?.didTapBack()
        }
        addSubview(backButton)

        onTap { [weak self] (_) in
            self?.dismissKeyboard()
        }

        onSwipeDown { [weak self] (_) in
            self?.dismissKeyboard()
        }

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

        loginLabel.setPosition(.positionTopHCenter, margins: .top(40))

        let controlSize = CGSize(width: width - 2 * Stylesheet.margin, height: Stylesheet.controlHeight)

        username.setRelativePosition(.relativePositionUnderCentered, toView: loginLabel, margins: .top(20), size: controlSize)

        password.setRelativePosition(.relativePositionUnderCentered, toView: username, margins: .top(5), size: controlSize)

        backButton.setPosition(.positionBottomHCenter, margins: .bottom(Stylesheet.margin + keyboardHeight), size: controlSize)

        continueButton.setRelativePosition(.relativePositionAboveCentered, toView: backButton, size: controlSize)
    }

    private func dismissKeyboard()
    {
        endEditing(true)
    }
}

extension LoginView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == username.textField {
            password.textField.becomeFirstResponder()
        } else {
            delegate?.didTapContinue()
        }

        return true
    }
}

extension LoginView
{
    func keyboardWillShow(_ notification: Notification)
    {
        BRYParseKeyboardNotification(notification) { [weak self] (duration, keyboardHeight, options) -> Void in
            self?.keyboardHeight = keyboardHeight
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: { 
                self?.setNeedsLayout()
                self?.layoutIfNeeded()
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
            }, completion: nil)
        }
    }
}
