//
//  Observable.swift
//  CSChat
//
//  Created by Hugo Lefrancois on 2017-03-23.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

class ObservableToken <T> : Equatable
{
    private weak var observable: Observable<T>?

    private let uuid = NSUUID().uuidString

    init(observable: Observable<T>)
    {
        self.observable = observable
    }

    func cancel()
    {
        observable?.unRegister(token: self)
    }

    public static func ==(lhs: ObservableToken, rhs: ObservableToken) -> Bool
    {
        return lhs.uuid == rhs.uuid
    }
}

class Observable <T>
{
    typealias RegisterCallback = (_ token: ObservableToken<T>, _ data: T) -> Void
    typealias ObservableData = (token: ObservableToken<T>, callback: RegisterCallback, dispatchQueue: DispatchQueue)

    private var observablesData: [ObservableData] = []

    private var lastNotifiedValue: T? = nil

    func notify(data: T)
    {
        for observableData in observablesData {
            observableData.dispatchQueue.async {
                observableData.callback(observableData.token, data)
            }
        }
        lastNotifiedValue = data
    }

    func register(dispatchQueue: DispatchQueue = DispatchQueue.main, callback: @escaping RegisterCallback) -> ObservableToken<T>
    {
        let token = ObservableToken(observable: self)
        observablesData.append(ObservableData(token: token, callback: callback, dispatchQueue: dispatchQueue))

        if let lastNotifiedValue = lastNotifiedValue {
            callback(token, lastNotifiedValue)
        }

        return token
    }

    func getLastValue() -> T?
    {
        return lastNotifiedValue
    }
    
    fileprivate func unRegister(token: ObservableToken<T>)
    {
        for (index, observableData) in observablesData.enumerated() {
            if observableData.token == token {
                observablesData.remove(at: index)
                break
            }
        }
    }
}
