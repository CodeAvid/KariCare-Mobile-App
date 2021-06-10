//
//  CoordinatorProtoco.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 05/06/2021.
//

import UIKit


protocol Coordinator {
    var childCoordinators: [Coordinator] { get set}
    var navigatorController: UINavigationController { get set}
    func start()
}
