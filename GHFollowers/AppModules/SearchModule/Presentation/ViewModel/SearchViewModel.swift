//
//  SearchViewModel.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation

/// Has the responsibility of passing on the username to use case layer for validation and talks to view controller with data
final class SearchViewModel: SearchViewModelProtocol {

    // MARK: - Properties
    var outputDelegate: SearchViewModelOutput?
    var inputDelegate: SearchViewModelInput?
    private let useCase: SearchUseCaseProtocol

    // MARK: - Initialize
    init(useCase: SearchUseCaseProtocol) {
        self.useCase = useCase
    }

    // MARK: - Method
    func pushFollowerListVC() {
        let userName = self.inputDelegate?.getUserName() ?? ""
        self.useCase.validateUser(for: userName) { result in
            if result {
                self.outputDelegate?.success()
            } else {
                self.outputDelegate?.errorMessage("Please enter a username")
            }
        }
    }
}
