//
//  MessageTableViewCell.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-25.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit
import Kingfisher

class MessageTableViewCell: UITableViewCell
{
    static let reuseIdentifier = MessageTableViewCell.description()

    private let profileImageWidth = 34.f
    private let profileImagePlaceholder = UIImage(named: "imgProfile")

    private let profileImageView = UIImageView()

    private let usernameLabel = UILabel()
    private let lastMessageLabel = UILabel()
    private let dateLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageWidth / 2
        profileImageView.size = CGSize(width: profileImageWidth, height: profileImageWidth)
        addSubview(profileImageView)

        usernameLabel.setProperties(font: .latoBold(18), textColor: .black, textAlignment: .left)
        addSubview(usernameLabel)

        lastMessageLabel.setProperties(font: .latoRegular(15), textColor: .black, textAlignment: .left, multiline: true)
        addSubview(lastMessageLabel)

        dateLabel.setProperties(font: .latoRegular(14), textColor: .purpleyGrey, textAlignment: .right)
        addSubview(dateLabel)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        layout(width: width)
    }

    func layout(width: CGFloat)
    {
        profileImageView.setPosition(.positionTopLeft, margins: .margins(top: Stylesheet.spacing / 2, left: Stylesheet.margin))

        let maxUsernameWidth = width - profileImageView.maxX - Stylesheet.spacing - dateLabel.width - Stylesheet.margin
        usernameLabel.setRelativePosition(.relativePositionToTheRightAlignedTop, toView: profileImageView, margins: .left(Stylesheet.spacing), size: CGSize(width: min(maxUsernameWidth, usernameLabel.width), height: usernameLabel.height))

        dateLabel.setRelativePosition(.relativePositionToTheRightCentered, toView: usernameLabel, margins: .left(Stylesheet.spacing))

        let messageFitSize = CGSize(width: width - profileImageView.maxX - Stylesheet.spacing - Stylesheet.margin, height: .max)
        lastMessageLabel.setRelativePosition(.relativePositionUnderAlignedLeft, toView: usernameLabel, margins: .top(2), fitSize: messageFitSize)
    }

    func configure(message: MessageViewModel)
    {
        profileImageView.kf.cancelDownloadTask()

        if let imageURL = URL(string: message.avatarUrl ?? "") {
            profileImageView.kf.setImage(with: ImageResource(downloadURL: imageURL), placeholder: profileImagePlaceholder)
        } else {
            profileImageView.image = profileImagePlaceholder
        }

        usernameLabel.setProperties(text: message.name, fit: true)
        lastMessageLabel.setProperties(text: message.message)
        dateLabel.setProperties(text: message.date?.lowercased(), fit: true)

        setNeedsLayout()
    }

    func height(forMessage message: MessageViewModel, inWidth width: CGFloat) -> CGFloat
    {
        configure(message: message)
        layout(width: width)

        return max(profileImageView.maxY, lastMessageLabel.maxY) + Stylesheet.spacing
    }
}
