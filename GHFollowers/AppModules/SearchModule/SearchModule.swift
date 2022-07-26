//
//  SearchModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import Foundation
import UIKit

/// Injecting all the required layers of clean architecture for Search module.
class SearchModule {

    init() {

    }

    //setting up Search View Controller
    func createSearchViewController() -> UIViewController {
        let viewController = SearchViewController.initialize(on: .main)
        viewController.viewModel = createSearchViewModel()
        viewController.viewModel?.outputDelegate = viewController
        viewController.viewModel?.inputDelegate = viewController 
        return viewController
    }

    //use case injected to view model
    private func createSearchViewModel() -> ISearchViewModel {
        let viewModel = SearchViewModelImpl(useCase: createSearchUseCase())
        return viewModel
    }

    private func createSearchUseCase() -> ISearchUseCase {
        let useCase = SearchUseCaseImpl()
        return useCase
    }
}
