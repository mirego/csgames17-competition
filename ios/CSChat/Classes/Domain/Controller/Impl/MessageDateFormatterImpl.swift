//
//  MessageDateFormatterImpl.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-25.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class MessageDateFormatterImpl: MessageDateFormatter
{
    private let dateParser: DateFormatter
    private let dateFormatter: DateFormatter

    private let lastWeekTimeInterval: TimeInterval = -60 * 60 * 24 * 6

    init()
    {
        dateParser = DateFormatter()
        dateParser.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        dateFormatter = DateFormatter()
        dateFormatter.doesRelativeDateFormatting = true
    }

    func shortFormat(dateString: String?) -> String
    {
        return format(dateString: dateString, showTime: false)
    }

    func mediumFormat(dateString: String?) -> String
    {
        return format(dateString: dateString, showTime: true)
    }

    private func format(dateString: String?, showTime: Bool) -> String {
        guard let dateString = dateString, let date = dateParser.date(from: dateString) else { return "" }

        if NSCalendar.current.isDateInToday(date) {
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: date)
        } else {
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = showTime ? .short : .none
            return dateFormatter.string(from: date)
        }
    }
}
