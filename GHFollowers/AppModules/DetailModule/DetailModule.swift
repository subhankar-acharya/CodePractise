//
//  DetailModule.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import UIKit

protocol DetailRouterProtocol: RouterProtocol { }

/// Injecting all the required layers of clean architecture for Detail module.
final class DetailModule: DetailRouterProtocol {

    var follower: Follower
    var navigationController: UINavigationController

    init(follower: Follower, navigationController: UINavigationController) {
        self.follower = follower
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = createFollowerDetailViewController()
        navigationController.pushViewController(vc, animated: true)
    }

    //setting up Detail View Controller
    func createFollowerDetailViewController() -> UIViewController {
        let viewController = FollowerDetailViewController.instantiate()
        viewController.viewModel = createDetailViewModel()
        viewController.coordinator = self
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }

    //use case injected to view model
    private func createDetailViewModel() -> DetailViewModelProtocol {
        let viewModel = DetailViewModel(follower: follower, useCase: createDetailUseCase())
        return viewModel
    }

    private func createDetailUseCase() -> DetailUseCaseProtocol {
        let useCase = DetailUseCase()
        return useCase
    }
}
