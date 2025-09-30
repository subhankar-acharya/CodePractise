//
//  MockService.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import Foundation
@testable import GHFollowers

class MockFollowersService: FollowerServiceProtocol {

    var follower: [Follower]?
    var error: Error?

    func makeNetworkRequest(completion: @escaping (Result<[Follower], Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
            return
        }
        if let follower = follower {
            completion(.success(follower))
            return
        }
        completion(.failure(NSError(domain: "com.example.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"])) )
    }
}
