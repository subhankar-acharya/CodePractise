//
//  FollowerServiceTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerServiceTest: XCTestCase {

    struct ErrorMessage {
        static let kFailedErrorMeesage = "User Failed Error"
    }

    var followerService: FollowerServiceImpl!
    let mockNetworkManager = MockFollowersNetworkManager()

    override func setUpWithError() throws {
        followerService = FollowerServiceImpl(network: mockNetworkManager)
    }

    func testService_Success() {
        let expecatation = expectation(description: "Success")
        mockNetworkManager.follower = MockFollowersData.follower
        followerService.makeNetworkRequest(for: "Test User")
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


    func testService_Error() {
        let expecatation = expectation(description: "User service on success case")
        mockNetworkManager.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kFailedErrorMeesage])
        followerService.makeNetworkRequest(for: "Test User")
            .catch { _ in
                expecatation.fulfill()
            }
        wait(for: [expecatation], timeout: 1.0)
    }

}
