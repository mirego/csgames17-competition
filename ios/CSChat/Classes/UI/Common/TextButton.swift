//
//  TextButton.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class TextButton: UIButton
{
    private let label = UILabel()

    override var isHighlighted: Bool {
        didSet {
            label.alpha = isHighlighted ? 0.6 : 1
        }
    }

    init(title: String)
    {
        super.init(frame: .zero)

        label.setProperties(text: title, font: .latoRegular(18), textColor: .purpleyGrey, fit: true)
        addSubview(label)

        height = Stylesheet.controlHeight
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        label.setPosition(.positionCenters)
    }
}
