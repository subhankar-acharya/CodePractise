//
//  ISerachViewModelImpl.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import Foundation

/// Has the responsibility of passing on the username to use case layer for validation and talks to view controller with data
class SearchViewModelImpl: ISearchViewModel {

    var outputDelegate: SearchViewModelOutput?
    var inputDelegate: SearchViewModelInput?

    private let useCase: ISearchUseCase
    
    init(useCase: ISearchUseCase) {
        self.useCase = useCase
    }

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
