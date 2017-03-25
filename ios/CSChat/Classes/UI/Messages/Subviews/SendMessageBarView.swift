//
//  SendMessageBarView.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class SendMessageBarView: UIView
{
    private let middleBackgroundView = UIView()
    let textField = UITextField()
    let sendButton = UIButton(type: .custom)

    private let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)

    init()
    {
        super.init(frame: CGRect.zero)

        backgroundColor = .white90

        middleBackgroundView.layer.cornerRadius = 5
        middleBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        addSubview(middleBackgroundView)

        textField.returnKeyType = .send
        textField.tintColor = .dustyOrange
        textField.placeholder = LocalizedString("MESSAGE_SEND_PLACE_HOLDER")
        textField.font = .latoRegular(14)
        addSubview(textField)

        sendButton.titleLabel?.font = .latoRegular(16)
        sendButton.setTitleColor(.dustyOrange, for: .normal)
        sendButton.setTitleColor(UIColor.dustyOrange.withAlphaComponent(0.6), for: .highlighted)
        sendButton.setTitle(LocalizedString("MESSAGE_SEND_BUTTON"), for: .normal)
        sendButton.sizeToFit()
        sendButton.width = sendButton.width + 20
        addSubview(sendButton)

        loadingIndicator.color = .dustyOrange
        addSubview(loadingIndicator)

        height = 48
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        middleBackgroundView.setPosition(.positionVCenterLeft, margins: .left(10), size: CGSize(width: width - 10 - sendButton.width, height: height - 10 * 2))

        textField.setPosition(.positionVCenterLeft, margins: .left(15), size: CGSize(width: width - 15 - sendButton.width, height: height))

        sendButton.setPosition(.positionVCenterRight, size: CGSize(width: sendButton.width, height: height))

        loadingIndicator.setPosition(.positionCenters, inView: sendButton)
    }

    func showLoading(_ loading: Bool)
    {
        if loading {
            loadingIndicator.startAnimating()
            sendButton.alpha = 0
        } else {
            loadingIndicator.stopAnimating()
            sendButton.alpha = 1
        }
    }
}
