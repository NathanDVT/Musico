//
//  ProfileScreenTests.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/04/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import XCTest

class HomeScreenTests: XCTestCase {

    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateToDashboard()
        sleep(1)
    }

    func testCanClickOnEminemTrending() {
        sleep(3)
        XCTAssert(application.otherElements["FirstTrendingTile"].exists)
        application.otherElements["FirstTrendingTile"].tap()
        XCTAssert(application.otherElements["FirstTrendingTile"].exists)
    }

    func testUserCanPlayRecentSong() {
        XCTAssert(application.buttons["recentButtonFirst"].exists)
        application.buttons["recentButtonFirst"].tap()
        XCTAssert(application.buttons["recentButtonFirst"].exists)
    }

    func testUserCanPlayPausePlay() {
        sleep(2)
        XCTAssert(application.buttons["recentButtonFirst"].exists)
        application.buttons["recentButtonFirst"].tap()
        sleep(2)
        XCTAssert(application.buttons["playPauseButton"].exists)
        application.buttons["playPauseButton"].tap()
        sleep(1)
        XCTAssert(application.buttons["playPauseButton"].exists)
    }
}
