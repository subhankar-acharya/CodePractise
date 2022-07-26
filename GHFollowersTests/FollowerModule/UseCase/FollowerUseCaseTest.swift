//
//  FollowerUseCaseTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerUseCaseTest: XCTestCase {

    struct ErrorMessage {
        static let kFailedErrorMeesage = "Use Case Failed Error"
    }

    var useCase: FollowerUseCaseImpl!
    let repository = MockFollowersRepository()

    override func setUpWithError() throws {
        useCase = FollowerUseCaseImpl(repository: repository)
    }

    func testUseCase_Success() {
        let expecatation = expectation(description: "Success")

        repository.follower = MockFollowersData.follower

        useCase.getFollowers(for: "Test User")
            .done { model in
                let followerCount = model.count
                if followerCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testUseCase_Failure() {
        let expecatation = expectation(description: "Failure")
        repository.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kFailedErrorMeesage])

        useCase.getFollowers(for: "Test User")
            .catch { error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kFailedErrorMeesage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
