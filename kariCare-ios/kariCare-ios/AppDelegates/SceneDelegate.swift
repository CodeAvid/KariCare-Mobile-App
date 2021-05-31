//
//  SceneDelegate.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScence = scene as? UIWindowScene{
            let window = UIWindow(windowScene: windowScence)
            window.rootViewController = TabBarMenuBaseController()
            self.window = window
            window.makeKeyAndVisible()
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

 

}

