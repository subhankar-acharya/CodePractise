//
//  MainCoordinator.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 07/08/22.
//

import UIKit

protocol Coordinator {
    //var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

protocol FollowerDetailProtcol: AnyObject {
    func loadFollowerDetail()
}

class MainCoordinator: Coordinator {
    //var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private let followerModule: FollowerModule
   // private let detailModule: DetailModule
    
    init(navigationController: UINavigationController, followerModule: FollowerModule) {
        self.navigationController = navigationController
        self.followerModule = followerModule
    }
    
    //bootstraps our app by creating our main viewcontroller
    func start() {
        let followerListController = followerModule.createFollowerListViewController()
        navigationController.pushViewController(followerListController, animated: false)
    }
    
    func loadFollowerDetail() {
//        let vc = BuyViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
    }
}
