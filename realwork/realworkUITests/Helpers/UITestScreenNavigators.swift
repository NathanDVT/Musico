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
        sleep(1)
        buttons["Proceed"].tap()
    }
}
