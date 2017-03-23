//
//  DataSource.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol DataSourceDelegate
{
    func didRefreshData()
}

class DataSource: NSObject
{
    fileprivate let TIME_API_URL = "https://script.google.com/macros/s/AKfycbyd5AcbAnWi2Yn0xhFRbyzS4qMq1VucMVgVvhul5XqS9HkAyJY/exec?tz=America/Montreal"
    
    // Example: Mon, 12 Mar 2017 09:41:00 -0400
    fileprivate let TIME_FORMAT = "EEE, d MMM yyyy HH:mm:ss Z"
    fileprivate let TIME_LOCALE = Locale(identifier: "en_US")
    
    fileprivate let dateFormatter = DateFormatter()
    
    fileprivate(set) var currentDate: Date?
    var delegate: DataSourceDelegate?
    
    override init()
    {
        super.init()
        
        dateFormatter.dateFormat = TIME_FORMAT
        dateFormatter.locale = TIME_LOCALE
    }
    
    func refreshData()
    {
        Alamofire.request(TIME_API_URL).responseJSON {
            response in
            
            switch response.result {
            case .success(let json):
                let json = JSON(json)
                
                if let value = json["fulldate"].string, let parsedDate = self.dateFormatter.date(from: value)
                {
                    self.currentDate = parsedDate
                }
                else
                {
                    self.currentDate = nil
                }
                
            case .failure(_):
                self.currentDate = nil
            }
            
            self.delegate?.didRefreshData()
        }
    }
}
