//
//  SearchModule.swift
//  GHFollowers
//
//  Created by Subhankar Acharya on 24/07/22.
//

import Foundation
import UIKit

class SearchModule {

    init() {

    }

    func createSearchViewController() -> UIViewController {
        let viewController = SearchViewController.initialize(on: .main)
        viewController.viewModel = createSearchViewModel()
        viewController.viewModel?.outputDelegate = viewController
        viewController.viewModel?.inputDelegate = viewController 
        return viewController
    }

    private func createSearchViewModel() -> ISearchViewModel {
        let viewModel = SearchViewModelImpl(useCase: createSearchUseCase())
        return viewModel
    }

    private func createSearchUseCase() -> ISearchUseCase {
        let useCase = SearchUseCaseImpl()
        return useCase
    }
}
