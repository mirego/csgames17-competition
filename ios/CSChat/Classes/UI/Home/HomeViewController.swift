//
//  MainViewController.swift
//  CSChat
//
//  Created by Émile Bélair on 17-03-23.
//  Copyright © 2017 Mirego. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController
{
    private var mainView: HomeView {
        return self.view as! HomeView
    }

    override func loadView()
    {
        view = HomeView()
        mainView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension HomeViewController: HomeViewDelegate
{
    func didTapLogin()
    {
        navigationController?.pushViewController(viewControllerFactory.loginViewController(), animated: true)
    }
}
