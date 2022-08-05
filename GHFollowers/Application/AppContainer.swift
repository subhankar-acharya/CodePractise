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
        let module = FollowerModule(networkManager: networkManager)
        let controller = module.createFollowerListViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
