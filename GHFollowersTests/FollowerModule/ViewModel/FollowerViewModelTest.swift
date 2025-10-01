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
    
    override func tearDownWithError() throws {
        followerViewModel = nil
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

    func testViewModel_EmptyData_Success() {
        expecatation = expectation(description: "Empty data success")
        useCase.follower = []
        followerViewModel?.fetchFollowers()
        wait(for: [expecatation], timeout: 1.0)
        XCTAssertTrue(followerViewModel?.followers.isEmpty == true)
    }

    func testViewModel_DelegatesCalledOnMainThread() {
        let expectation = expectation(description: "Delegate called on main thread")
        final class MainThreadProbe: FollowerViewModelOutput {
            let expectation: XCTestExpectation
            init(expectation: XCTestExpectation) { self.expectation = expectation }
            func success() {
                XCTAssertTrue(Thread.isMainThread)
                expectation.fulfill()
            }
            func errorMessage(_ error: String) {
                XCTAssertTrue(Thread.isMainThread)
                expectation.fulfill()
            }
        }
        let probe = MainThreadProbe(expectation: expectation)
        followerViewModel?.outputDelegate = probe
        useCase.follower = MockFollowersData.follower
        followerViewModel?.fetchFollowers()
        wait(for: [expectation], timeout: 1.0)
        followerViewModel?.outputDelegate = self
    }
}

extension FollowerViewModelTest: FollowerViewModelOutput {

    func success() {
        expecatation.fulfill()
    }

    func errorMessage(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        expecatation.fulfill()
    }
}
