//
//  SearchModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//
import UIKit

/// Injecting all the required layers of clean architecture for Search module.
final class SearchModule {

    //setting up Search View Controller
    func createSearchViewController() -> UIViewController {
        let viewController = SearchViewController.instantiate()
        viewController.viewModel = createSearchViewModel()
        viewController.viewModel?.outputDelegate = viewController
        viewController.viewModel?.inputDelegate = viewController 
        return viewController
    }

    //use case injected to view model
    private func createSearchViewModel() -> SearchViewModelProtocol {
        let viewModel = SearchViewModel(useCase: createSearchUseCase())
        return viewModel
    }

    private func createSearchUseCase() -> SearchUseCaseProtocol {
        let useCase = SearchUseCase()
        return useCase
    }
}
