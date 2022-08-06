//
//  FollowersTableUITests.swift
//  GHFollowersUITests
//
//  Created by Subhankar Acharya on 06/08/22.
//

import XCTest

class FollowersTableUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testBasic_Behavior() {
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Followers"].staticTexts["Followers"].tap()
        
        let followerstableviewTable = app/*@START_MENU_TOKEN@*/.tables["FollowersTableView"]/*[[".otherElements[\"Followers\"].tables[\"FollowersTableView\"]",".tables[\"FollowersTableView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        followerstableviewTable.cells.containing(.staticText, identifier:"JOSH").children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        
        let followersButton = app.navigationBars["Follower"].buttons["Followers"]
        followersButton.tap()
        followerstableviewTable.cells.containing(.staticText, identifier:"RBAZINET").children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        followersButton.tap()
        followerstableviewTable.cells.containing(.staticText, identifier:"TREVORTURK").children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.staticTexts["Profile"]/*[[".otherElements[\"Follower\"]",".buttons[\"Profile\"].staticTexts[\"Profile\"]",".buttons[\"didTapProfile\"].staticTexts[\"Profile\"]",".staticTexts[\"Profile\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.otherElements["URL"]/*[[".otherElements[\"BrowserView?WebViewProcessID=14957\"]",".otherElements[\"TopBrowserBar\"]",".buttons[\"Address\"]",".otherElements[\"Address\"]",".otherElements[\"URL\"]",".buttons[\"URL\"]"],[[[-1,4],[-1,3],[-1,5,3],[-1,2,3],[-1,1,2],[-1,0,1]],[[-1,4],[-1,3],[-1,5,3],[-1,2,3],[-1,1,2]],[[-1,4],[-1,3],[-1,5,3],[-1,2,3]],[[-1,4],[-1,3]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func testFollowersTableView() {
        app.launch()
        
        let followersTableView = app.tables["FollowersTableView"]
        
        XCTAssertTrue(followersTableView.exists, "The followers tableview exists")
        
        //Gets an array of cells
        let tableCells = followersTableView.cells
        XCTAssert(tableCells.element.waitForExistence(timeout: 3.0))
        
        if tableCells.count > 0 {
            //Loop through only first 4 cell.
            let count: Int = (tableCells.count > 4) ? 4 : (tableCells.count - 1)
            
            let promise = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: i)
                // It takes to next screen
                tableCell.tap()
                if i == (count - 1) {
                    promise.fulfill()
                }
                // Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
