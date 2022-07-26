//
//  FollowerViewModelImpl.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

class FollowerViewModelImpl: IFollowerViewModel {
    var ghUserName: String
    var outputDelegate: FollowerViewModelOutput?
    var followers: [Follower] = []

    private let useCase: IFollowerUseCase

    func fetchFollowers() {
        useCase.getFollowers(for: ghUserName)
            .done(on: .main) { [weak self] model in
                debugPrint("Success ===> ", model)
                self?.getData(model: model)
            }
            .catch(on: .main, policy: .allErrors) { [weak self] error in
                self?.outputDelegate?.gotError(error.localizedDescription)
            }
    }

    private func getData(model: [Follower]) {
        followers = model
        outputDelegate?.success()
    }

    init(useCase: IFollowerUseCase,ghUserName:String) {
        self.useCase = useCase
        self.ghUserName = ghUserName
    }
}
