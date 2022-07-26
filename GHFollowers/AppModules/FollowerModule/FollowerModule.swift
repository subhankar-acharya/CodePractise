//
//  UserModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 21/07/22.
//

import Foundation
import UIKit

class FollowerModule {

    private let networkManager: INetworkManager
    private let ghUserName:String
    

    init(ghUserName:String) {
        self.networkManager = AppContainer().networkManager
        self.ghUserName = ghUserName
    }

    func createFollowerListViewController() -> UIViewController {
        let viewController = FollowerListViewController.init(nibName: "FollowerListViewController", bundle: nil)
        viewController.viewModel = createFollowerViewModel()
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }

    private func createFollowerViewModel() -> IFollowerViewModel {
        let viewModel = FollowerViewModelImpl(useCase: createFollowerUseCase(), ghUserName: self.ghUserName)
        return viewModel
    }

    private func createFollowerUseCase() -> IFollowerUseCase {
        let useCase = FollowerUseCaseImpl(repository: createFollowerRepository())
        return useCase
    }

    private func createFollowerRepository() -> IFollowerRepository {
        let repository = FollowerRepositoryImpl(service: createFollowerService())
        return repository
    }

    private func createFollowerService() -> IFollowerService {
        let service = FollowerServiceImpl(network: networkManager)
        return service
    }

}

