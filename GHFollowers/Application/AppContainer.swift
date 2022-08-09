//
//  AppContainer.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import UIKit
/// Setting up the Follower module and global network variable to provide it to module which requires it in future.
final class AppContainer {
    
    lazy var networkManager: NetworkManagerProtocol = {
       let networkManager = NetworkManger()
        return networkManager
    }()

    func startApp(on window: UIWindow?) {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let module = FollowerModule(networkManager: networkManager, navigationController: navigationController)
        module.start()
    }
}
