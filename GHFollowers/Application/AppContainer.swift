//
//  AppContainer.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import Foundation
import UIKit

class AppContainer {
    
    lazy var networkManager: INetworkManager = {
       let networkManager = NetworkManger()
        return networkManager
    }()

    func startApp(on window: UIWindow?) {
        let module = SearchModule()
        let controller = module.createSearchViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
