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

    var searchViewModel: SearchViewModel?
    var useCase = MockSearchUseCase()
    var expecatation: XCTestExpectation!

    override func setUpWithError() throws {
        searchViewModel = SearchViewModel(useCase: useCase)
        searchViewModel?.outputDelegate = self
        searchViewModel?.inputDelegate = self
    }

    func testViewModel_Success() {
        expecatation = expectation(description: "Success case")
        useCase.validateUser(for: MockSearchData.userName) { result in
            if result {
                self.searchViewModel?.outputDelegate?.success()
            } else {
                XCTFail("Failure not expected in this case.")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }

    func testViewModel_Failure() {
        expecatation = expectation(description: "This should get fail")
        useCase.validateUser(for: MockSearchData.userName) { result in
            if result {
                XCTFail("Success not expected in this case.")
            } else {
                self.searchViewModel?.outputDelegate?.errorMessage("Failed Error")
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }

}

extension SearchFollowerViewModelTest: SearchViewModelOutput {

    func success() {
        expecatation.fulfill()
    }

    func errorMessage(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        expecatation.fulfill()
    }
}

extension SearchFollowerViewModelTest: SearchViewModelInput {
    func getUserName() -> String {
        return MockSearchData.userName
    }
}
