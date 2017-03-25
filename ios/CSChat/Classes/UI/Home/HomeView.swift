//
//  HomeView.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import MRGTaylor
import UIKit
import GestureRecognizerClosures

protocol HomeViewDelegate: class
{
    func didTapLogin()
}

class HomeView: UIView
{
    weak var delegate: HomeViewDelegate?

    private let appLogoImageView = UIImageView(image: UIImage(named: "icnAppLogo"))

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    private let loginButton = GenericButton(title: LocalizedString("LOGIN_BUTTON"), backgroundColor: .dustyOrange)

    private let registerButton = GenericButton(title: LocalizedString("REGISTER_BUTTON"), backgroundColor: .pinkishGrey)

    init()
    {
        super.init(frame: CGRect.zero)

        backgroundColor = .white

        addSubview(appLogoImageView)

        titleLabel.setProperties(text: LocalizedString("HOME_TITLE"), font: .latoMedium(28), textColor: .black, textAlignment: .center, fit: true)
        addSubview(titleLabel)

        subtitleLabel.setProperties(text: LocalizedString("HOME_SUBTITLE"), font: .latoRegular(18), textColor: .purpleyGrey, textAlignment: .center, fit: true)
        addSubview(subtitleLabel)

        _ = loginButton.on(.touchUpInside) { [weak self] (_) in
            self?.delegate?.didTapLogin()
        }
        addSubview(loginButton)

        registerButton.isEnabled = false
        addSubview(registerButton)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        appLogoImageView.setPosition(.positionCenters, margins: .bottom(height * 0.3))

        titleLabel.setRelativePosition(.relativePositionUnderCentered, toView: appLogoImageView, margins: .top(22))

        subtitleLabel.setRelativePosition(.relativePositionUnderCentered, toView: titleLabel, margins: .top(2))

        let buttonSize = CGSize(width: width - 2 * Stylesheet.margin, height: Stylesheet.controlHeight)
        registerButton.setPosition(.positionBottomHCenter, margins: .bottom(Stylesheet.margin + 2), size: buttonSize)

        loginButton.setRelativePosition(.relativePositionAboveCentered, toView: registerButton, margins: .bottom(Stylesheet.spacing), size: buttonSize)
    }
}
