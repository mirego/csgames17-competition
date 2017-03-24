//
//  GenericButton.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class GenericButton: UIButton
{
    private let highlightOverlay = UIView()

    private let label = UILabel()

    private lazy var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .white)

    override var isHighlighted: Bool {
        didSet {
            highlightOverlay.alpha = isHighlighted ? 1 : 0
        }
    }

    var isLoading: Bool = false {
        didSet {
            if isLoading {
                if loadingIndicator.superview == nil {
                    addSubview(loadingIndicator)
                    loadingIndicator.setPosition(.positionCenters)
                }
                loadingIndicator.startAnimating()
                loadingIndicator.alpha = 1
                label.alpha = 0
                isEnabled = false
            } else {
                loadingIndicator.stopAnimating()
                loadingIndicator.alpha = 0
                label.alpha = 1
                isEnabled = true
            }
        }
    }

    init(title: String, backgroundColor: UIColor)
    {
        super.init(frame: .zero)

        self.backgroundColor = backgroundColor
        layer.cornerRadius = 8

        label.setProperties(text: title, font: .latoBold(20), textColor: .white, fit: true)
        addSubview(label)

        highlightOverlay.layer.cornerRadius = layer.cornerRadius
        highlightOverlay.alpha = 0
        highlightOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        addSubview(highlightOverlay)

        height = Stylesheet.controlHeight
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        highlightOverlay.size = size

        label.setPosition(.positionCenters)
    }
}
