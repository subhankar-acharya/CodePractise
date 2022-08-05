//
//  FollowerServiceTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 25/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerServiceTest: XCTestCase {

    var followerService: FollowerService?
    let mockNetworkManager = MockFollowersNetworkManager()

    override func setUpWithError() throws {
        followerService = FollowerService(network: mockNetworkManager)
    }

    func testService_Success() {
        let expecatation = expectation(description: "Success")
        mockNetworkManager.follower = MockFollowersData.follower
        guard let followerService = followerService else { return }
        followerService.makeNetworkRequest()
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
        let expecatation = expectation(description: "Follower service on success case")
        mockNetworkManager.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kServiceFailedErrorMeesage])
        guard let followerService = followerService else { return }
        followerService.makeNetworkRequest()
            .catch { _ in
                expecatation.fulfill()
            }
        wait(for: [expecatation], timeout: 1.0)
    }
}
