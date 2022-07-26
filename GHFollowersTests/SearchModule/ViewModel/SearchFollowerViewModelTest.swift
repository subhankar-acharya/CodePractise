//
//  SearchFollowerViewModel.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import XCTest
@testable import GHFollowers
import XCTest

class SearchFollowerViewModelTest: XCTestCase {

    var searchViewModel: SearchViewModelImpl?
    var useCase = MockSearchUseCase()
    var expecatation: XCTestExpectation!

    override func setUpWithError() throws {
        searchViewModel = SearchViewModelImpl(useCase: useCase)
        searchViewModel?.outputDelegate = self
        searchViewModel?.inputDelegate = self
    }

    func testViewModel_Success() {
        expecatation = expectation(description: "Success")
        useCase.validateUser(for: MockSearchData.userName) { result in
            if result {
                self.searchViewModel?.outputDelegate?.success()
            } else {
                XCTFail("Failure not expected")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }

    func testViewModel_Fail() {
        expecatation = expectation(description: "Should get fail")
        useCase.validateUser(for: MockSearchData.userName) { result in
            if result {
                XCTFail("Success not expected")
            } else {
                self.searchViewModel?.outputDelegate?.gotError("Failed Error")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }

}


extension SearchFollowerViewModelTest: SearchViewModelOutput {

    func success() {
        expecatation.fulfill()
    }

    func gotError(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        expecatation.fulfill()
    }
}

extension SearchFollowerViewModelTest: SearchViewModelInput {
    func getUserName() -> String {
        return MockSearchData.userName
    }
}
