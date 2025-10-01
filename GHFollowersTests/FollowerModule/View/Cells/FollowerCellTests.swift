//
//  FollowerCellTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 10/1/25.
//

import XCTest
@testable import GHFollowers

final class FollowerCellTests: XCTestCase {
    func test_Set_SetsUppercasedNameAndDisclosure() {
        let cell = FollowerCell(style: .default, reuseIdentifier: FollowerCell.Constants.reuseID)
        let follower = Follower(login: "john", avatarUrl: "https://example.com/a.png", username: "John", htmlUrl: "https://example.com")
        cell.set(follower: follower)
        XCTAssertEqual(cell.usernameLabel.text, "JOHN")
        XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
    }
}

