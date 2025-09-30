//
//  AppContainerTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 9/30/25.
//
//

import XCTest
import UIKit
@testable import GHFollowers

final class AppContainerTests: XCTestCase {

    // Window that avoids making key/visible to prevent view loading side effects
    final class NoOpWindow: UIWindow {
        override func makeKeyAndVisible() { /* no-op for tests */ }
    }

    func test_StartApp_SetsRootNavigationWithFollowerList() {
        let window = NoOpWindow(frame: UIScreen.main.bounds)
        let container = AppContainer()
        container.startApp(on: window)

        guard let nav = window.rootViewController as? UINavigationController else {
            return XCTFail("Root is not UINavigationController")
        }
        guard let listVC = nav.viewControllers.first as? FollowerListViewController else {
            return XCTFail("Top VC is not FollowerListViewController")
        }

        // Depedency injection checks viewModel exists and delegate is set
        XCTAssertNotNil(listVC.viewModel)
        XCTAssertTrue((listVC.viewModel?.outputDelegate as AnyObject?) === listVC)
    }
}
