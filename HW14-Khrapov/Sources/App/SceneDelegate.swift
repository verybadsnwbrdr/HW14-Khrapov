//
//  SceneDelegate.swift
//  HW14-Khrapov
//
//  Created by Anton on 05.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarController = TabBarViewController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

