//
//  DetailViewControllerTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import XCTest
@testable import GHFollowers

class FollowerDetailViewControllerTests: XCTestCase {

    var sut = FollowerDetailViewController.instantiate()

    override func setUpWithError() throws {
        sut.loadViewIfNeeded()
    }

    func testDetailViewController_WhenCreated_HasLabel() throws {
        //helps us unwrap optional values
        let detailNameLabel = try XCTUnwrap(sut.detailNameLabel, "The Detail Name label is not connected to an IBOutlet")
        XCTAssertEqual(detailNameLabel.text, "", "Detail name label is empty when view controller initially loaded")
    }

    func testDetailViewController_WhenCreated_HasGetFollowersButtonAndAction() throws {
        let tapProfileButton: UIButton = try XCTUnwrap(sut.profileButton, "The Profile button does not have a referencing IBOutlet")
        let tapProfileButtonAction = try XCTUnwrap(tapProfileButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Tap Profile button does not have any actions assigned to it")
        XCTAssertEqual(tapProfileButtonAction.count, 1)
        //check if action assigned to button is the one expected
        XCTAssertEqual(tapProfileButtonAction.first, "didTapProfile:", "No action with a name didTapProfile assigned to profile button")
    }

    func test_ShowFollowerDetail_PopulatesUI() {
        // Given a follower and view model
        let follower = MockDetailData.follower
        let vm = DetailViewModel(follower: follower, useCase: DetailUseCase())
        sut.viewModel = vm
        
        // View was already loaded in setUp, so directly invoke detail population
        sut.showFollowerDetail()

        // Then
        XCTAssertEqual(sut.detailNameLabel.text, follower.username)
    }
}
