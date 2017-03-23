//
//  ViewController.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    fileprivate let TIME_REFRESH_INTERVAL: TimeInterval = 1
    
    fileprivate let dataSource: DataSource
    
    fileprivate let dateFormatter = DateFormatter()
    fileprivate var refreshTimer: Timer?
    
    init(dataSource: DataSource)
    {
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
        
        dataSource.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView()
    {
        view = View()
    }
    
    deinit
    {
        deleteTimer()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        createTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        deleteTimer()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    func refreshData()
    {
        dataSource.refreshData()
    }
}

// PMARK: Private
extension ViewController
{
    fileprivate func createTimer()
    {
        refreshTimer = Timer.scheduledTimer(timeInterval: TIME_REFRESH_INTERVAL, target: self, selector: #selector(ViewController.refreshData), userInfo: nil, repeats: true)
        refreshTimer?.fire()
    }
    
    fileprivate func deleteTimer()
    {
        refreshTimer?.invalidate()
        refreshTimer = nil
    }
}

// PMARK: DataSourceDelegate
extension ViewController: DataSourceDelegate
{
    func didRefreshData()
    {
        let view = self.view as? View
        
        if let currentDate = dataSource.currentDate
        {
            dateFormatter.dateFormat = "EEEE"
            let weekDay = dateFormatter.string(from: currentDate as Date)
            
            dateFormatter.dateFormat = "dd"
            let day = dateFormatter.string(from: currentDate as Date)
            
            dateFormatter.dateFormat = "MMMM"
            let month = dateFormatter.string(from: currentDate as Date)
            
            dateFormatter.dateFormat = "HH'h' mm'm' ss's'"
            let time = dateFormatter.string(from: currentDate as Date)
            
            view?.refreshDate(weekDay: weekDay, day: day, month: month, time: time)
        }
        else
        {
            view?.refreshDate(weekDay: "", day: "--", month: "", time: "")
        }
    }
}
