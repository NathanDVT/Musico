//
//  EntryScreenTests.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/03/19.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest

class EntryScreenTests: XCTestCase {
    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateStartToLogin()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testUserCanNavigateToArtistSearchPage() {
//        application.buttons["Sign Up"].tap()
//        usleep(useconds_t(50))
//        application.buttons["Register"].tap()
//        sleep(1)
//        XCTAssert(application.tables.searchFields["Enter Artist To Search"].exists)
//    }



//    func testUserCanRotateDeviceAndNavigate() {
//        XCUIDevice.shared.orientation = .landscapeLeft
//        application.buttons["Sign Up"].tap()
//        usleep(useconds_t(5000))
//        application.buttons["Register"].tap()
//        sleep(1)
//        XCTAssert(application.tables.searchFields["Enter Artist To Search"].exists)
//    }
}
