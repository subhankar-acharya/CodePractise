//
//  FollowerDetailViewControllerWiringTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 9/30/25.
//
//

import XCTest
import UIKit
import SafariServices
@testable import GHFollowers

final class FollowerDetailViewControllerWiringTests: XCTestCase {

    private func makeWindowRooted(_ vc: UIViewController) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.makeKeyAndVisible()
        // Keep window alive for the scope of test by associating it
        objc_setAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque(), window, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    func test_ProfileButton_PresentsSafari_ForValidURL() {
        let sut = FollowerDetailViewController.instantiate()
        let follower = Follower(login: "u", avatarUrl: "https://example.com/a.png", username: "name", htmlUrl: "https://example.com")
        let vm = DetailViewModel(follower: follower, useCase: DetailUseCase())
        sut.viewModel = vm
        sut.viewModel?.outputDelegate = sut
        makeWindowRooted(sut)
        sut.loadViewIfNeeded()

        sut.didTapProfile(self)

        let exp = expectation(description: "Presents Safari VC")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(sut.presentedViewController is SFSafariViewController)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }

    func test_ProfileButton_ShowsAlert_ForInvalidURL() {
        let sut = FollowerDetailViewController.instantiate()
        let follower = Follower(login: "u", avatarUrl: "https://example.com/a.png", username: "name", htmlUrl: "")
        let vm = DetailViewModel(follower: follower, useCase: DetailUseCase())
        sut.viewModel = vm
        sut.viewModel?.outputDelegate = sut
        makeWindowRooted(sut)
        sut.loadViewIfNeeded()

        sut.didTapProfile(self)

        let exp = expectation(description: "Presents error alert")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            guard let alert = sut.presentedViewController as? UIAlertController else {
                XCTFail("Expected alert controller to be presented")
                return
            }
            XCTAssertEqual(alert.view.accessibilityIdentifier, "errorAlertDialog")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
}

