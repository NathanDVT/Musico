//
//  ProfileScreenTests.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/04/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import XCTest

class SearchScreenTests: XCTestCase {

    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateToSearchScreen()
        sleep(2)
    }

    func testUserCanTypeArtistName() {
        sleep(1)
        XCTAssert(application.searchFields["Search"].exists)
        application.searchFields["Search"].tap()
        sleep(1)
        application.searchFields["Search"].typeText("Artist")
        sleep(2)
        XCTAssert(application.searchFields["Search"].exists)
    }

    func testUserCanSearchArtist() {
        sleep(1)
        XCTAssert(application.searchFields["Search"].exists)
        application.searchFields["Search"].tap()
        sleep(1)
        application.searchFields["Search"].typeText("Drake")
        sleep(2)
        application.buttons["search"].tap()
        sleep(2)
        application.searchFields["Search"].typeText("Drake")
        XCTAssert(application.staticTexts["Drake"].exists)
    }

    func testUserCanScrollOnSearchedArtists() {
        sleep(1)
        application.searchFields["Search"].tap()
        sleep(1)
        application.searchFields["Search"].typeText("Drake")
        sleep(2)
        application.buttons["search"].tap()
        sleep(2)
        application.searchFields["Search"].typeText("Drake")
        application.swipeUp()
        XCTAssert(application.staticTexts["Drake"].exists)
    }

    func testUserCanPlayMusic() {
        sleep(1)
        application.searchFields["Search"].tap()
        sleep(1)
        application.searchFields["Search"].typeText("Drake")
        XCTAssert(application.staticTexts["Select song to play"].exists)
        application.buttons["search"].tap()
        sleep(2)
        application.searchFields["Search"].typeText("Drake")
        application.staticTexts["Drake"].firstMatch.tap()
        XCTAssert(application.staticTexts["Drake"].exists)
        sleep(1)
        XCTAssertFalse(application.staticTexts["Select song to play"].exists)
    }
//    UIPasteboard.general.string = "12345678"
//    application.secureTextFields["Password"].doubleTap()
//    sleep(1)
//    application.menuItems["Paste"].tap()
    func testUserCanAArefreshKeyboard() {
        sleep(1)
        UIPasteboard.general.string = "Drake"
        application.searchFields["Search"].doubleTap()
    }

    func testUserCanAddToPlaylist() {
        sleep(1)
        application.searchFields["Search"].tap()
        sleep(1)
        application.searchFields["Search"].typeText("Drake")
        XCTAssert(application.staticTexts["Select song to play"].exists)
        application.buttons["search"].tap()
        sleep(2)
        application.swipeLeft()
        application.buttons["ADD"].tap()
        sleep(1)
        XCTAssert(application.buttons["Select"].exists)
        application.buttons["Select"].firstMatch.tap()
    }

    func testUserCanCancelAddToPlaylist() {
        sleep(1)
        application.searchFields["Search"].tap()
        sleep(1)
        application.searchFields["Search"].typeText("Drake")
        XCTAssert(application.staticTexts["Select song to play"].exists)
        application.buttons["search"].tap()
        sleep(2)
        application.swipeLeft()
        application.buttons["ADD"].tap()
        sleep(1)
        XCTAssert(application.buttons["Cancel"].exists)
        application.buttons["Cancel"].firstMatch.tap()
    }
}
