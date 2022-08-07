//
//  SceneDelegate.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let appContainer = AppContainer()
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController()
        
        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: navController, followerModule: <#FollowerModule#>)
        
        // tell the coordinator to take over control
        coordinator?.start()
        appContainer.startApp(on: window)
    }
}

