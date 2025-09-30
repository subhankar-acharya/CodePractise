//
//  FollowerRepository.swift
//  GHFollowers
//
//  Created by Subhankar  Acharya on 21/07/22.
//

import Foundation
/// Passes data to service layer and returns back response 
class FollowerRepository: FollowerRepositoryProtocol {

    private let service: FollowerServiceProtocol

    init(service: FollowerServiceProtocol) {
        self.service = service
    }

    func makeServiceCallToGetFollowers(completion: @escaping (Result<[Follower], Error>) -> Void) {
        return service.makeNetworkRequest(completion: completion)
    }
}
