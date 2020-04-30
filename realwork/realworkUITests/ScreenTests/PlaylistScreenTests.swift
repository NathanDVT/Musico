//
//  ProfileScreenTests.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/04/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import Foundation
import XCTest

class PlaylistScreenTests: XCTestCase {

    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateToPlaylists()
        sleep(3)
    }

    func testUserCanSeePlaylists() {
        XCTAssert(application.staticTexts["Recent"].exists)
    }

    func testUserCanGetToCreatePlaylist() {
        XCTAssert(application.staticTexts["Create Playlist"].exists)
        application.staticTexts["Create Playlist"].tap()
        XCTAssert(application.buttons["Cancel"].firstMatch.exists)
        application.buttons["Cancel"].firstMatch.tap()
    }

//    func testUserCanSeePlaylists() {
//        XCTAssert(application.staticTexts["Recent"].exists)
//    }
}
