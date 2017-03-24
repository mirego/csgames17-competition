//
//  Localization.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import Foundation

func LocalizedString(_ key: String, comment: String = "") -> String
{
    return NSLocalizedString(key, comment: comment)
}
