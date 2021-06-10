//
//  ComponentsShimmers.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 05/06/2021.
//

import UIKit

protocol ComponentsShimmers {
    var animationDuration: Double { get }
    func hideViews()
    func showViews()
    func setShimmer()
    func removeShimmer()

}
