//
//  FollowerRepositoryTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerRepositoryTest: XCTestCase {

    struct ErrorMessage {
        static let kFailedErrorMeesage = "Repository Failed Error"
    }

    var followerRepository: FollowerRepositoryImpl!
    let mockService = MockFollowersService()

    override func setUpWithError() throws {
        followerRepository = FollowerRepositoryImpl(service: mockService)
    }

    func testRepository_Success() {
        let expecatation = expectation(description: "Success")
        mockService.follower = MockFollowersData.follower
        followerRepository.makeServiceCallToGetFollowers(for: "Test User")
            .done { model in
                let followerCount = model.count
                if followerCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testRepository_Failure() {
        let expecatation = expectation(description: "Failure")
        mockService.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kFailedErrorMeesage])
        followerRepository.makeServiceCallToGetFollowers(for: "Test User")
            .catch {error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kFailedErrorMeesage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
