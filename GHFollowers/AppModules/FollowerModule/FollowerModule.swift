//
//  UserModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 21/07/22.
//

import Foundation
import UIKit
/// Builds up all the layer of Follower module.
class FollowerModule {

    private let networkManager: INetworkManager
    private let ghUserName:String
    
    init(ghUserName:String) {
        self.networkManager = AppContainer().networkManager
        self.ghUserName = ghUserName
    }
    //setting up Follower View Controller
    func createFollowerListViewController() -> UIViewController {
        let viewController = FollowerListViewController.init(nibName: "FollowerListViewController", bundle: nil)
        viewController.viewModel = createFollowerViewModel()
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
    //injecting use case layer
    private func createFollowerViewModel() -> IFollowerViewModel {
        let viewModel = FollowerViewModelImpl(useCase: createFollowerUseCase(), ghUserName: self.ghUserName)
        return viewModel
    }
    //injecting repository layer
    private func createFollowerUseCase() -> IFollowerUseCase {
        let useCase = FollowerUseCaseImpl(repository: createFollowerRepository())
        return useCase
    }
    //injecting service layer
    private func createFollowerRepository() -> IFollowerRepository {
        let repository = FollowerRepositoryImpl(service: createFollowerService())
        return repository
    }
    // injecting network layer
    private func createFollowerService() -> IFollowerService {
        let service = FollowerServiceImpl(network: networkManager)
        return service
    }

}

