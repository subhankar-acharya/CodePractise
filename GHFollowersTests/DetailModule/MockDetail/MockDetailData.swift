//
//  MockDetail.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 05/08/22.
//

import Foundation
@testable import GHFollowers

struct MockDetailData {
    static let follower: Follower = Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" )
}

extension MockDetailData {
    static func mockDictionary() -> Data {
        let encoded = try! JSONEncoder().encode(follower)
        return encoded
    }
}
