//
//  DataFetchedDelegate.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import Foundation

protocol DataFetchedDelegate {
    func onDataFetched()
    func onFetchError(error: Error)
}
