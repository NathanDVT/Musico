//
//  LoginScreenTests.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/03/30.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest

class LoginScreenTests: XCTestCase {

    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
        application.navigateStartToLogin()
    }

    func testUserCanEnterEmail() {
        application.textFields["E-mail"].tap()
        application.textFields["E-mail"].typeText("nate@gmail.com")
        XCTAssert(application.textFields["nate@gmail.com"].exists)
    }

    func testUserEnterInvalidLoginCredentials() {
        application.textFields["E-mail"].tap()
        application.textFields["E-mail"].typeText("nate@gmail.com")
        application.keyboards.buttons["return"].tap()
        application.buttons["Login"].tap()
        sleep(1)
        XCTAssertEqual(application.alerts.element.label, "Opps Unsuccessful Login")
    }

    func testUserCanLogin() {
        application.textFields["E-mail"].tap()
        application.textFields["E-mail"].typeText("nate@gmail.com")
        let navnTextField = application.secureTextFields["Password"]
        UIPasteboard.general.string = "12345678"
        navnTextField.doubleTap()
        application.menuItems.element(boundBy: 0).tap()
        sleep(1)
        application.buttons["Login"].tap()
        sleep(3)
        XCTAssert(application.staticTexts["Signed in as"].exists)
    }
}
