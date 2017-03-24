//
//  MessageViewModel.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-24.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

protocol MessageViewModel
{
    var name: String? { get }
    var message: String? { get }
    var date: String? { get }
    var avatarUrl: String? { get }
}
