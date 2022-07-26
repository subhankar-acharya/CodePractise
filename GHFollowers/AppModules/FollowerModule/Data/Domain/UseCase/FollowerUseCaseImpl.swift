//
//  FollowerUseCaseImpl.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation

class FollowerUseCaseImpl: IFollowerUseCase {

    private let repository: IFollowerRepository

    init(repository: IFollowerRepository) {
        self.repository = repository
    }

    func getFollowers(for userName: String) -> FollowerResponse {
        return repository.makeServiceCallToGetFollowers(for: userName)
    }
}
