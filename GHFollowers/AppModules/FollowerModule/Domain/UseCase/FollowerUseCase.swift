//
//  FollowerUseCase.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
/// Passes user name string to repository layer 
class FollowerUseCase: FollowerUseCaseProtocol {

    private let repository: FollowerRepositoryProtocol

    init(repository: FollowerRepositoryProtocol) {
        self.repository = repository
    }

    func getFollowers() -> FollowerResponse {
        return repository.makeServiceCallToGetFollowers()
    }
}
