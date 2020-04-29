//
//  ProfileScreenTests.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/04/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import XCTest

class ProfileScreenTests: XCTestCase {

    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateToProfile()
    }

    func testCrowdsTextVisible() {
        XCTAssert(application.staticTexts["Crowds"].exists)
    }

    func testUserCanLogout() {
        application.buttons["Log Out"].tap()
        XCTAssert(application.buttons["OK"].exists)
        application.buttons["OK"].tap()
        sleep(2)
        XCTAssert(application.staticTexts["Welcome to Musico"].exists)
    }

    func testUserCanCancelLogout() {
        application.buttons["Log Out"].tap()
        XCTAssert(application.buttons["Cancel"].exists)
        application.buttons["Cancel"].tap()
        XCTAssert(application.staticTexts["Crowds"].exists)
    }
}
