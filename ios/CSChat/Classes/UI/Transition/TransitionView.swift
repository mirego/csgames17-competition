//
//  TransitionView.swift
//  iHeart
//
//  Created by Hugo Lefrancois on 2016-01-14.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

class TransitionView: UIView
{
    fileprivate var contentView: UIView
    fileprivate var transitionView: UIView? = nil
    
    init(contentView: UIView)
    {
        self.contentView = contentView

        super.init(frame: CGRect.zero)

        addSubview(contentView)
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        contentView.mc_setPosition(.positionTopLeft, withMargins: UIEdgeInsets.zero, size: mc_size())
        transitionView?.mc_setPosition(.positionTopLeft, withMargins: UIEdgeInsets.zero, size: mc_size())
    }

    func transitionToView(_ view: UIView, completion: @escaping () -> Void)
    {
        transitionView = view
        transitionView!.frame = contentView.frame
        UIView.transition(from: contentView, to: view, duration: 0.5, options: .transitionCrossDissolve) { (finished) -> Void in
            self.contentView = view
            self.transitionView = nil
            completion()
        }
    }
}
