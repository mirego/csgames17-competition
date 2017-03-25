//
//  ControllerFactory.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class ControllerFactory
{
    private let serviceFactory: ServiceFactory
    private let dateFormatter: MessageDateFormatter

    init(serviceFactory: ServiceFactory)
    {
        self.serviceFactory = serviceFactory
        self.dateFormatter = MessageDateFormatterImpl()
    }

    func loginController() -> LoginController
    {
        return LoginControllerImpl(loginService: serviceFactory.loginService())
    }

    func conversationsController() -> ConversationsController
    {
        return ConversationsControllerImpl(loginService: serviceFactory.loginService(), conversationsService: serviceFactory.conversationsService(), dateFormatter: dateFormatter)
    }
}
