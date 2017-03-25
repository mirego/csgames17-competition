//
//  ConversationTableViewCell.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import Kingfisher
import UIKit

class ConversationTableViewCell: UITableViewCell
{
    static let reuseIdentifier = ConversationTableViewCell.description()

    private let profileImageWidth = 45.f
    private let profileImagePlaceholder = UIImage(named: "imgProfile")

    private let topMargin = 8.f
    private let horizontalMargin = 12.f
    private let verticalMargin = 2.f

    private let profileImageView = UIImageView()

    private let usernameLabel = UILabel()
    private let lastMessageLabel = UILabel()
    private let dateLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageWidth / 2
        profileImageView.mc_setSize(CGSize(width: profileImageWidth, height: profileImageWidth))
        addSubview(profileImageView)

        usernameLabel.setProperties(font: .latoBold(18), textColor: .black, textAlignment: .left)
        addSubview(usernameLabel)

        lastMessageLabel.setProperties(font: .latoRegular(15), textColor: .purpleyGrey, textAlignment: .left, multiline: true)
        lastMessageLabel.numberOfLines = 2
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

        profileImageView.setPosition(.positionVCenterLeft, margins: .left(Stylesheet.margin))

        let dateSize = dateLabel.sizeThatFits(size)

        let usernameWidth = width - dateSize.width - Stylesheet.margin * 2 - horizontalMargin * 2 - profileImageView.width
        usernameLabel.setPosition(.positionTopLeft, margins: .margins(top: topMargin, left: profileImageView.maxX + horizontalMargin), size: CGSize(width: usernameWidth, height: usernameLabel.sizeThatFits(CGSize(width: usernameWidth, height: height)).height))

        dateLabel.setRelativePosition(.relativePositionToTheRightCentered, toView: usernameLabel, margins: .left(horizontalMargin), size: dateSize)

        let lastMessageWidth = width - horizontalMargin - Stylesheet.margin - profileImageView.maxX
        lastMessageLabel.mc_setRelativePosition(.relativePositionUnderAlignedLeft, to: usernameLabel, withMargins: .top(verticalMargin), size:  CGSize(width: lastMessageWidth, height: lastMessageLabel.sizeThatFits(CGSize(width: lastMessageWidth, height: height)).height))
    }

    func configure(conversation: ConversationViewModel)
    {
        profileImageView.kf.cancelDownloadTask()

        if let imageURL = URL(string: conversation.avatarUrl ?? "") {
            profileImageView.kf.setImage(with: ImageResource(downloadURL: imageURL), placeholder: profileImagePlaceholder)
        } else {
            profileImageView.image = profileImagePlaceholder
        }

        usernameLabel.text = conversation.name
        lastMessageLabel.text = conversation.message

        dateLabel.text = conversation.date

        setNeedsLayout()
        layoutIfNeeded()
    }
}
