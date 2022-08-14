//
//  FollowerModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 21/07/22.
//

import UIKit

protocol FollowerRouterProtocol: RouterProtocol {
    func showDetailModule(followerModel: Follower)
}

/// Builds up all the layer of Follower module.
final class FollowerModule: FollowerRouterProtocol {

    // MARK: - Properties
    private let networkManager: NetworkManagerProtocol
    var navigationController: UINavigationController
    private enum Constants {
        static let nibName = "FollowerListViewController"
    }

    // MARK: - Initialise
    init(networkManager:NetworkManagerProtocol, navigationController: UINavigationController) {
        self.networkManager = networkManager
        self.navigationController = navigationController
    }

    // MARK: - Methods
    func start() {
        let vc = createFollowerListViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetailModule(followerModel: Follower) {
        let module = DetailModule(follower: followerModel, navigationController: navigationController)
        module.start()
    }
    
    //setting up Follower View Controller
    func createFollowerListViewController() -> UIViewController {
        let viewController = FollowerListViewController.init(nibName: Constants.nibName, bundle: nil)
        viewController.viewModel = createFollowerViewModel()
        viewController.coordinator = self
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
    //injecting use case layer
    private func createFollowerViewModel() -> FollowerViewModelProtocol {
        let viewModel = FollowerViewModel(useCase: createFollowerUseCase())
        return viewModel
    }
    //injecting repository layer
    private func createFollowerUseCase() -> FollowerUseCaseProtocol {
        let useCase = FollowerUseCase(repository: createFollowerRepository())
        return useCase
    }
    //injecting service layer
    private func createFollowerRepository() -> FollowerRepositoryProtocol {
        let repository = FollowerRepository(service: createFollowerService())
        return repository
    }
    // injecting network layer
    private func createFollowerService() -> FollowerServiceProtocol {
        let service = FollowerService(network: networkManager)
        return service
    }
}

