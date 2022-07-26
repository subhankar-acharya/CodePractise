//
//  MockUseCase.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import Foundation
import PromiseKit
@testable import GHFollowers

class MockFollowersUseCase: IFollowerUseCase {

    var follower: [Follower]?
    var error: Error?

    func getFollowers(for userName: String) -> FollowerResponse {
        return Promise { seal in
            if let _ = error {
                seal.reject(GFError.invalidData)
            } else {
                if let follower = follower {
                    seal.fulfill(follower)
                }
            }
        }
    }
}
