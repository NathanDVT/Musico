//
//  FirstScenario.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/03/16.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest

class FirstScenario: XCTestCase {
    var application: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserCanNavigateToArtistSearchPage() {
        application.buttons["Sign Up"].tap()
        usleep(useconds_t(50))
        application.buttons["Register"].tap()
        sleep(1)
        XCTAssert(application.tables.searchFields["Enter Artist To Search"].exists)
    }

    func testUserCanEnterEmailAndPassword() {
        application.textFields["E-mail"].tap()
        application.keys["u"].tap()
        application.keys["s"].tap()
        application.keys["e"].tap()
        application.keys["r"].tap()
        XCTAssert(application.textFields["user"].exists)
    }

    func testUserCanRotateDeviceAndNavigate(){
        XCUIDevice.shared.orientation = .landscapeLeft
        application.buttons["Sign Up"].tap()
        usleep(useconds_t(5000))
        application.buttons["Register"].tap()
        sleep(1)
        XCTAssert(application.tables.searchFields["Enter Artist To Search"].exists)
    }
}
