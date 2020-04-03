//
//  OnBoardScreenTest.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/03/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest

class OnBoardScreenTest: XCTestCase {
    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateStartToOnBoarding()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserCanSwipeLeftThanRightOnOnboardingScreen() {
        XCTAssert(application.staticTexts["Welcome to Musico"].exists)
        application.swipeRight()
        XCTAssert(application.staticTexts["Welcome to Musico"].exists)
        application.swipeLeft()
        sleep(1)
        XCTAssert(application.staticTexts["Collaborate together"].exists)
        application.swipeLeft()
        sleep(1)
        XCTAssert(application.staticTexts["Build Custom Playlists"].exists)
        application.swipeLeft()
        sleep(1)
        XCTAssert(application.staticTexts["Build Custom Playlists"].exists)
        application.swipeRight()
        sleep(1)
        XCTAssert(application.staticTexts["Collaborate together"].exists)
        application.swipeRight()
        sleep(1)
        XCTAssert(application.staticTexts["Welcome to Musico"].exists)
    }

    func testUserCanFindProceedButtonExists() {
        application.swipeLeft()
        application.swipeLeft()
        XCTAssert(application.buttons["Proceed"].exists)
    }

}
