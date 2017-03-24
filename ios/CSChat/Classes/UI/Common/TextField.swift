//
//  TextField.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class TextField: UIView
{
    let textField = UITextField()

    private let line = UIView()

    init(hint: String)
    {
        super.init(frame: .zero)

        textField.textColor = .black
        textField.font = .latoRegular(20)
        textField.placeholder = hint
        addSubview(textField)

        line.backgroundColor = .pinkishGrey
        addSubview(line)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        textField.setPosition(.positionTopLeft, margins: .left(5), size: CGSize(width: width - 10, height: height - 1))
        line.setPosition(.positionBottomHCenter, size: CGSize(width: width, height: 1))
    }
}
