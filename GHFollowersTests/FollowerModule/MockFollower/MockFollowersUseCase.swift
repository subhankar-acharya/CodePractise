//
//  MockUseCase.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import Foundation
import PromiseKit
@testable import GHFollowers

class MockFollowersUseCase: FollowerUseCaseProtocol {

    var follower: [Follower]?
    var error: Error?

    func getFollowers() -> FollowerResponse {
        return Promise { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let follower = follower {
                    seal.fulfill(follower)
                }
            }
        }
    }
}
