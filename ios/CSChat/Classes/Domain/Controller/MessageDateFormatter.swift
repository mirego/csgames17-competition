//
//  MessageDateFormatter.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-25.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

protocol MessageDateFormatter
{
    func shortFormat(dateString: String?) -> String
    func mediumFormat(dateString: String?) -> String
}
