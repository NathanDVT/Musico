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
}
