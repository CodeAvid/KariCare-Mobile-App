//
//  TabItem.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//


import UIKit
enum TabItem: String, CaseIterable {
    case home = "home"
    case profile = "profile"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .profile:
            return ProfileViewController()
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: Constants.TabIcon.home)!
        case .profile:
            return UIImage(systemName: Constants.TabIcon.person)!
        }
    }
    
   
    
}
