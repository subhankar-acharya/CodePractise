//
//  DetailModule.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 04/08/22.
//

import UIKit

/// Injecting all the required layers of clean architecture for Detail module.
final class DetailModule {

    var follower: Follower

    init(follower: Follower) {
        self.follower = follower
    }

    //setting up Detail View Controller
    func createFollowerDetailViewController() -> UIViewController {
        let viewController = FollowerDetailViewController.instantiate()
        viewController.viewModel = createDetailViewModel()
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
