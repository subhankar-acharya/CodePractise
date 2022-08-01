//
//  UserModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 21/07/22.
//

import UIKit
/// Builds up all the layer of Follower module.
final class FollowerModule {

    // MARK: - Properties
    private let networkManager: NetworkManagerProtocol
    private let ghUserName:String

    // MARK: - Initialise
    init(ghUserName:String) {
        self.networkManager = AppContainer().networkManager
        self.ghUserName = ghUserName
    }

    // MARK: - Methods
    //setting up Follower View Controller
    func createFollowerListViewController() -> UIViewController {
        let viewController = FollowerListViewController.init(nibName: Constants.NibName.identifier, bundle: nil)
        viewController.viewModel = createFollowerViewModel()
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
    //injecting use case layer
    private func createFollowerViewModel() -> FollowerViewModelProtocol {
        let viewModel = FollowerViewModel(useCase: createFollowerUseCase(), ghUserName: self.ghUserName)
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

