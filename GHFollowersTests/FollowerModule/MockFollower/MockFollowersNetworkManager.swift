//
//  MockNetworkManager.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import Foundation
@testable import GHFollowers

class MockFollowersNetworkManager: NetworkManagerProtocol {

    var follower: [Follower]?
    var error: Error?

    func request<T: Decodable>(
        _ type: T.Type,
        endPoint: URL,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        if let error = error {
            completion(.failure(error))
            return
        }
        if let follower = follower, let casted = follower as? T {
            completion(.success(casted))
            return
        }
        completion(.failure(NSError(domain: "com.example.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"])) )
    }
}
