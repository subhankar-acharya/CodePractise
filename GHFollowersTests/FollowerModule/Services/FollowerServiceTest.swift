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
    
    override func tearDownWithError() throws {
        followerService = nil
    }

    func testService_Success() {
        let expecatation = expectation(description: "Success")
        mockNetworkManager.follower = MockFollowersData.follower
        guard let followerService = followerService else { return }
        followerService.makeNetworkRequest { result in
            switch result {
            case .success(let model):
                let followerCount = model.count
                if followerCount >= 1 {
                    expecatation.fulfill()
                }
            case .failure:
                XCTFail("Unexpected failure in service success test")
                expecatation.fulfill()
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }

    func testService_Error() {
        let expecatation = expectation(description: "Follower service on success case")
        mockNetworkManager.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kServiceFailedErrorMeesage])
        guard let followerService = followerService else { return }
        followerService.makeNetworkRequest { result in
            if case .failure = result {
                expecatation.fulfill()
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }
}
