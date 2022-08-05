//
//  FollowerModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 21/07/22.
//

import UIKit
/// Builds up all the layer of Follower module.
final class FollowerModule {

    // MARK: - Properties
    private let networkManager: NetworkManagerProtocol
    private enum Constants {
        static let nibName = "FollowerListViewController"
    }

    // MARK: - Initialise
    init(networkManager:NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    // MARK: - Methods
    //setting up Follower View Controller
    func createFollowerListViewController() -> UIViewController {
        let viewController = FollowerListViewController.init(nibName: Constants.nibName, bundle: nil)
        viewController.viewModel = createFollowerViewModel()
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

