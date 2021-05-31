//
//  TabViewController.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

class TabBarMenuBaseController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: TabItem.home.viewController,icon: TabItem.home.icon),
            createNavController(viewController: TabItem.profile.viewController, icon:  TabItem.profile.icon),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, icon: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = UIColor(named: Constants.Colors.bgColor)
        navController.navigationBar.isHidden = true
        navController.tabBarItem.image = icon
        return navController
        
    }
    
}
