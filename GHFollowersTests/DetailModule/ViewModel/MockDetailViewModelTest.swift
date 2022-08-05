//
//  MockDetailViewModelTest.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 05/08/22.
//

import XCTest
@testable import GHFollowers

class MockDetailViewModelTest: XCTestCase  {

    var detailViewModel: DetailViewModel?
    var useCase = MockDetailUseCase()
    var follower = MockDetailData.follower
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        detailViewModel = DetailViewModel(follower: follower, useCase: useCase)
        detailViewModel?.outputDelegate = self
    }

    func testViewModel_Success() {
        expectation = expectation(description: "Success case")
        useCase.validateURL(for: follower.htmlUrl) { result in
            if result {
                self.detailViewModel?.outputDelegate?.success()
            } else {
                XCTFail("Failure not expected in this case")
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testViewModel_Failure() {
        expectation = expectation(description: "This is failure case")
        useCase.validateURL(for: follower.htmlUrl) { result in
            if result {
                XCTFail("Success is not expected in this case")
            } else {
                self.detailViewModel?.outputDelegate?.errorMessage("Failed Error")
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

extension MockDetailViewModelTest: DetailViewModelOutputProtocol {
    func success() {
        expectation.fulfill()
    }

    func errorMessage(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        expectation.fulfill()
    }
}
