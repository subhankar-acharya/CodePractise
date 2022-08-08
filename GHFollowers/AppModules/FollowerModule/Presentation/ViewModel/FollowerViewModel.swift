//
//  FollowerViewModel.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
/// Calls the use case layer and passes back data to viewcontroller via delegate pattern
final class FollowerViewModel: FollowerViewModelProtocol {
    // MARK: - Properties
    weak var outputDelegate: FollowerViewModelOutput?
    var followers: [Follower] = []
    private let useCase: FollowerUseCaseProtocol

    // MARK: - Initialise
    init(useCase: FollowerUseCaseProtocol) {
        self.useCase = useCase
    }

    // MARK: - Methods
    func fetchFollowers() {
        useCase.getFollowers()
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
