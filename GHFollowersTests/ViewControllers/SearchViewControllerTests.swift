//
//  SearchViewControllerTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import XCTest
@testable import GHFollowers

class SearchViewControllerTests: XCTestCase {

    var sut = SearchViewController.instantiate()

    override func setUpWithError() throws {
        sut.loadViewIfNeeded()
    }

    func testSearchViewController_WhenCreated_HasTextFieldEmpty() throws {
        //helps us unwrap optional values
        let userNameTextField = try XCTUnwrap(sut.userNameTextField, "The User name textField is not connected to an IBOutlet")
        XCTAssertEqual(userNameTextField.text, "", "User name textField not empty when view controller initially loaded")
    }

    func testSearchViewController_WhenCreated_HasGetFollowersButtonAndAction() throws {
        let getFollowersButton: UIButton = try XCTUnwrap(sut.getFollowersButton, "The Get followers does not have a referencing IBOutlet")
        let getGollowersButtonAction = try XCTUnwrap(getFollowersButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Get Followers button does not have any actions assigned to it")
        XCTAssertEqual(getGollowersButtonAction.count, 1)
        //check if action assigned to button is the one expected
        XCTAssertEqual(getGollowersButtonAction.first, "didTapGetFollowers", "No action with a name didTapGetFollowers assigned to get followers button")
    }
}
