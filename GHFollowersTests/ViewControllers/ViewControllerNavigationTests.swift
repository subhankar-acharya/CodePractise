//
//  ViewControllerNavigationTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 26/07/22.
//

import XCTest
@testable import GHFollowers

class ViewControllerNavigationTests: XCTestCase {

    var sut: SearchViewController!
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "SearchViewController") as SearchViewController
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }

    func testGetFollowerButton_WhenTapped_FollowersViewControllerIsPushed() {

        let testPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is FollowerListViewController
        }
        expectation(for: testPredicate, evaluatedWith: navigationController)
        sut.getFollowersButton.sendActions(for: .touchUpInside)
        waitForExpectations(timeout: 2)
    }
}
