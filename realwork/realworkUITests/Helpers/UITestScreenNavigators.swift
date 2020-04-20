//
//  UITestScreenNavigators.swift
//  realworkUITests
//
//  Created by Nathan Ngobale on 2020/03/17.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest

extension XCUIApplication {
    func navigateStartToOnBoarding() {
        XCUIDevice.shared.orientation = .portrait
        self.buttons["Onboarding"].tap()
        sleep(1)
    }

    func navigateStartToLogin() {
        navigateStartToOnBoarding()
        swipeLeft()
        swipeLeft()
        buttons["Proceed"].tap()
        sleep(1)
    }

    func navigateToDashboard() {
        navigateStartToLogin()
        buttons["Login"].tap()
        sleep(1)
    }

    func navigateToSearchScreen() {
        navigateToDashboard()
        buttons["Search"].tap()
    }

    func navigateToProfile() {
        XCUIDevice.shared.orientation = .portrait
        self.buttons["Dashboard"].tap()
        sleep(1)
        self.buttons["dashboardToProfile"].tap()
        sleep(1)
    }
}

//extension XCUIElement {
//    // The following is a workaround for inputting text in the
//    //simulator when the keyboard is hidden
//    func setText(text: String, application: XCUIApplication) {
//        UIPasteboard.general.string = text
//        doubleTap()
//        application.menuItems["Paste"].tap()
//    }
//}
