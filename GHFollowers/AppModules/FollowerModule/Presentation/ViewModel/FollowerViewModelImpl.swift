//
//  FollowerViewModelImpl.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
/// Passes the username string to use case layer and callbacks viewcontroller with data
class FollowerViewModelImpl: IFollowerViewModel {

    var ghUserName: String
    var outputDelegate: FollowerViewModelOutput?
    var followers: [Follower] = []

    private let useCase: IFollowerUseCase

    init(useCase: IFollowerUseCase, ghUserName: String) {
        self.useCase = useCase
        self.ghUserName = ghUserName
    }

    func fetchFollowers() {
        useCase.getFollowers(for: ghUserName)
            .done(on: .main) { [weak self] model in
                self?.getData(model: model)
            }
            .catch(on: .main, policy: .allErrors) { [weak self] error in
                self?.outputDelegate?.errorMessage(error.localizedDescription)
            }
    }

    private func getData(model: [Follower]) {
        followers = model
        outputDelegate?.success()
    }
}
