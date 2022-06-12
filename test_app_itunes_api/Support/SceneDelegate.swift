//
//  SceneDelegate.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 06.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = AuthorizationViewController()
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
    }
}
