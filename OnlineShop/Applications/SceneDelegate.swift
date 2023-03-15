//
//  SceneDelegate.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//        let tabBarController = TabBarController()
        let signInViewController = SignInViewController()
        
        window = UIWindow(frame: windowScene.screen.bounds)
        window?.windowScene = windowScene
//        window?.rootViewController = tabBarController
        window?.rootViewController = signInViewController
        window?.makeKeyAndVisible()
        
    }
}

