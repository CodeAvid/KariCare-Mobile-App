//
//  MainCoordinator.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 05/06/2021.
//

import UIKit

class MainCoordinator: Coordinator{
    
    var childCoordinators  = [Coordinator]()
    
    var navigatorController: UINavigationController
    
    init(navigatorController: UINavigationController) {
        self.navigatorController = navigatorController
        
    }
    
    func start() {
       
    }
    
    
}
