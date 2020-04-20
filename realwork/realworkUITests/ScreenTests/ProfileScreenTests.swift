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
}
