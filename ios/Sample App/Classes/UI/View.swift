//
//  View.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import MCUIViewLayout
import UIKit

class View: UIView
{
    fileprivate let weekDayLabel = UILabel()
    fileprivate let dayLabel = UILabel()
    fileprivate let monthLabel = UILabel()
    fileprivate let timeLabel = UILabel()
    fileprivate var labels: [UIView] {
        return [weekDayLabel, dayLabel, monthLabel, timeLabel]
    }
    
    init()
    {
        super.init(frame: CGRect.zero)
        
        backgroundColor = UIColor(forHex: "#8d644b")
        
        weekDayLabel.font = UIFont.systemFont(ofSize: 36, weight: UIFontWeightUltraLight)
        weekDayLabel.textColor = UIColor.white
        addSubview(weekDayLabel)
        
        dayLabel.font = UIFont.systemFont(ofSize: 80, weight: UIFontWeightMedium)
        dayLabel.textColor = UIColor.white
        addSubview(dayLabel)
        
        monthLabel.font = UIFont.systemFont(ofSize: 36, weight: UIFontWeightLight)
        monthLabel.textColor = UIColor.white
        addSubview(monthLabel)
        
        timeLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightMedium)
        timeLabel.textColor = UIColor.white
        addSubview(timeLabel)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        let margin1: CGFloat = 40
        let margin2: CGFloat = 0
        let margin3: CGFloat = 60
        
        let totalHeight = labels.reduce(0, { $0 + $1.mc_height() }) + margin1 + margin2 + margin3
        
        weekDayLabel.mc_setPosition(.positionTopHCenter, withMargins: UIEdgeInsets(top: (mc_height() - totalHeight) / 2, left: 0, bottom: 0, right: 0))
        
        dayLabel.mc_setRelativePosition(.relativePositionUnderCentered, to: weekDayLabel, withMargins: UIEdgeInsets(top: margin1, left: 0, bottom: 0, right: 0))
        
        monthLabel.mc_setRelativePosition(.relativePositionUnderCentered, to: dayLabel, withMargins: UIEdgeInsets(top: margin2, left: 0, bottom: 0, right: 0))
        
        timeLabel.mc_setRelativePosition(.relativePositionUnderCentered, to: monthLabel, withMargins: UIEdgeInsets(top: margin3, left: 0, bottom: 0, right: 0))
    }
}

// PMARK: Public
extension View
{
    func refreshDate(weekDay: String, day: String, month: String, time: String)
    {
        weekDayLabel.text = weekDay
        weekDayLabel.sizeToFit()
        
        dayLabel.text = day
        dayLabel.sizeToFit()
        
        monthLabel.text = month
        monthLabel.sizeToFit()
        
        timeLabel.text = time
        timeLabel.sizeToFit()
        
        setNeedsLayout()
    }
}
