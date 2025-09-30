//
//  FollowerListViewControllerTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 9/30/25.
//
//

import XCTest
import UIKit
@testable import GHFollowers

final class FollowerListViewControllerTests: XCTestCase {

    // Simple mock view model that returns canned followers and calls delegate
    final class MockFollowerViewModel: FollowerViewModelProtocol {
        var followers: [Follower] = []
        weak var outputDelegate: FollowerViewModelOutput?
        var followersToReturn: [Follower] = MockFollowersData.follower ?? []
        func fetchFollowers() {
            followers = followersToReturn
            outputDelegate?.success()
        }
    }

    func makeSUT(with followers: [Follower] = MockFollowersData.follower ?? []) -> (vc: FollowerListViewController, vm: MockFollowerViewModel) {
        let vc = FollowerListViewController(nibName: "FollowerListViewController", bundle: Bundle(for: FollowerListViewController.self))
        let vm = MockFollowerViewModel()
        vm.followersToReturn = followers
        vc.viewModel = vm
        vc.viewModel?.outputDelegate = vc
        return (vc, vm)
    }

    func test_WhenLoaded_SetsTitleAndAccessibilityIdentifiers() {
        let (vc, _) = makeSUT()
        vc.loadViewIfNeeded()
        XCTAssertEqual(vc.title, "Followers")
        XCTAssertEqual(vc.view.accessibilityIdentifier, "Followers")
        XCTAssertEqual(vc.tableView.accessibilityIdentifier, "FollowersTableView")
    }

    func test_TableView_RendersRowsFromViewModel() {
        let followers = MockFollowersData.follower ?? []
        let (vc, _) = makeSUT(with: followers)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.makeKeyAndVisible()

        vc.loadViewIfNeeded()

        // Allow UI to process reloadData
        RunLoop.current.run(until: Date().addingTimeInterval(0.05))

        XCTAssertEqual(vc.tableView.numberOfRows(inSection: 0), followers.count)
    }

    func test_DidSelectRow_NavigatesToDetail() {
        let followers = MockFollowersData.follower ?? []
        let (vc, _) = makeSUT(with: followers)
        let nav = UINavigationController(rootViewController: vc)
        // Trigger load
        _ = nav.view
        vc.loadViewIfNeeded()

        // Allow UI to process reloadData
        RunLoop.current.run(until: Date().addingTimeInterval(0.05))

        vc.tableView.delegate?.tableView?(vc.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        // Navigation should push Detail VC
        RunLoop.current.run(until: Date().addingTimeInterval(0.05))
        XCTAssertTrue(nav.topViewController is FollowerDetailViewController)
    }
}
