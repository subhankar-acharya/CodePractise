//
//  MockData.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import Foundation
@testable import GHFollowers

struct MockFollowersData {

    static let follower: [Follower]? = [Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ), Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ), Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ), Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" ),Follower(login: "Test User", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4" )]
}

extension MockFollowersData {
    static func mockDictionary() -> Data {
        let encoded = try? JSONEncoder().encode(follower)
        return encoded ?? Data()
    }
}
