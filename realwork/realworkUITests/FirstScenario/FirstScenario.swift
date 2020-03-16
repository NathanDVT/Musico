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

    func testUserCanEnterEmail() {
        application.textFields["E-mail"].tap()
        application.keys["u"].tap()
        application.keys["s"].tap()
        application.keys["e"].tap()
        application.keys["r"].tap()
        XCTAssert(application.textFields["user"].exists)
    }

    func testUserCanRotateDeviceAndNavigate() {
        XCUIDevice.shared.orientation = .landscapeLeft
        application.buttons["Sign Up"].tap()
        usleep(useconds_t(5000))
        application.buttons["Register"].tap()
        sleep(1)
        XCTAssert(application.tables.searchFields["Enter Artist To Search"].exists)
    }

    func testUserCanSearchArtistScrollUpScrollLeftPlayMusic() {
        XCUIDevice.shared.orientation = .portrait
        application.buttons["Sign Up"].tap()
        application.buttons["Register"].tap()
        application.tables.searchFields["Enter Artist To Search"].tap()
        application.keys["D"].tap()
        application.keys["r"].tap()
        application.keys["a"].tap()
        application.keys["k"].tap()
        application.keys["e"].tap()
        application.buttons["search"].tap()
        sleep(1)
        XCTAssert(application.staticTexts["Scorpion"].exists)
        application.swipeUp()
        sleep(1)
        XCTAssert(application.staticTexts["Views"].exists)
        application.swipeLeft()
        XCTAssert(application.buttons["PLAY"].exists)
        application.buttons["PLAY"].tap()
        sleep(3)
    }

    func testUserCanSearchPlayAndPauseMusic() {
        XCUIDevice.shared.orientation = .portrait
        application.buttons["Sign Up"].tap()
        application.buttons["Register"].tap()
        application.tables.searchFields["Enter Artist To Search"].tap()
        application.keys["D"].tap()
        application.keys["r"].tap()
        application.keys["a"].tap()
        application.keys["k"].tap()
        application.keys["e"].tap()
        application.buttons["search"].tap()
        sleep(1)
        application.swipeLeft()
        application.buttons["PLAY"].tap()
        sleep(1)
        application.swipeLeft()
        XCTAssert(application.buttons["PAUSE"].exists)
        application.buttons["PAUSE"].tap()
        sleep(1)
    }

    func testUserCanGetToVideosScreen() {
        XCUIDevice.shared.orientation = .portrait
        application.buttons["Sign Up"].tap()
        application.buttons["Register"].tap()
        application.tables.searchFields["Enter Artist To Search"].tap()
        application.keys["D"].tap()
        application.keys["r"].tap()
        application.keys["a"].tap()
        application.keys["k"].tap()
        application.keys["e"].tap()
        application.buttons["search"].tap()
        sleep(1)
        application.buttons["Videos"].tap()
        application.swipeUp()
        sleep(1)
        XCTAssert(application.buttons["Add"].exists)
        sleep(1)
    }
}
