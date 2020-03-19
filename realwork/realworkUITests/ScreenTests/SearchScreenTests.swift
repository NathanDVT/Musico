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
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateToSearchScreen()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserCanSearchArtistScrollUpScrollLeftPlayMusic() {
        XCUIDevice.shared.orientation = .portrait
        application.tables.searchFields["Enter Artist To Search"].tap()
        application.tables.searchFields["Enter Artist To Search"].typeText("Drake")
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
        application.tables.searchFields["Enter Artist To Search"].tap()
        application.tables.searchFields["Enter Artist To Search"].typeText("Drake")
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
        application.tables.searchFields["Enter Artist To Search"].tap()
        application.tables.searchFields["Enter Artist To Search"].typeText("Drake")
        application.buttons["search"].tap()
        sleep(1)
        application.buttons["Videos"].tap()
        application.swipeUp()
        sleep(1)
        XCTAssert(application.buttons["Add"].exists)
        sleep(1)
    }
}
