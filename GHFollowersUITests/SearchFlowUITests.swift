//
//  SearchFlowUITests.swift
//  SearchFlowUITests
//
//  Created by Subhankar Acharya on 24/07/22.
//

import XCTest

class SearchFlowUITests: XCTestCase {
    
    func testSearchViewController_WhenLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        //accessing with Accessility identifier
        let userName = app.textFields["enterUserTextField"]
        let getFollowersButton = app.buttons["getFollowersButton"]
        XCTAssertTrue(userName.isEnabled , "User Name textfield is not enabled for user interaction")
        XCTAssertTrue(getFollowersButton.isEnabled , "Get followers button is not enabled for user interaction")
    }

    func testSearchViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        let app = XCUIApplication()
        app.launch()
        let userName = app.textFields["enterUserTextField"]
        userName.tap()
        userName.typeText(" ")
        let getFollowersButton = app.buttons["getFollowersButton"]
        getFollowersButton.tap()
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An error alert dialog was not presented when invalid form was submitted")
    }

    func testGetFollowersButton_WhenTapped_PresentsFollowerListViewController() {
        let app = XCUIApplication()
        app.launch()
        let userName = app.textFields["enterUserTextField"]
        userName.tap()
        userName.typeText("twostraws")
        app.buttons["getFollowersButton"].tap()
        XCTAssertTrue(app.otherElements["FollowerListViewController"].waitForExistence(timeout: 1), "The FollowerListViewController was not presented when the Get Followers button was tapped")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
