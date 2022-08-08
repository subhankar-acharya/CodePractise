//
//  FollowerViewModelTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerViewModelTest: XCTestCase {

    var followerViewModel: FollowerViewModel?
    var useCase = MockFollowersUseCase()
    var expecatation: XCTestExpectation!

    override func setUpWithError() throws {
        followerViewModel = FollowerViewModel(useCase: useCase)
        followerViewModel?.outputDelegate = self
    }

    func testViewModel_Success() {
        expecatation = expectation(description: "Success")
        useCase.follower = MockFollowersData.follower
        followerViewModel?.fetchFollowers()
        wait(for: [expecatation], timeout: 1.0)
    }

    func testViewModel_Fail() {
        expecatation = expectation(description: "Should get fail")
        useCase.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"])
        followerViewModel?.fetchFollowers()
        wait(for: [expecatation], timeout: 1.0)
    }
}

extension UserViewModelTest: FollowerViewModelOutput {

    func success() {
        expecatation.fulfill()
    }

    func errorMessage(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        expecatation.fulfill()
    }
}
