//
//  AlertableTests.swift
//  GHFollowersTests
//
//  Created by Subhankar  Acharya on 9/30/25.
//

import XCTest
import UIKit
@testable import GHFollowers

final class AlertableTests: XCTestCase, Alertable {
    func test_ShowAlert_PresentsAlertController() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()

        let expectation = expectation(description: "Alert presented")
        showAlert(message: "Error", on: vc)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            guard let presented = vc.presentedViewController as? UIAlertController else {
                XCTFail("No alert controller presented")
                return
            }
            XCTAssertEqual(presented.view.accessibilityIdentifier, "errorAlertDialog")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}

