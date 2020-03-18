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
        self.buttons["Onboarding"].tap()
        sleep(1)
    }
    
    func navigateStartToLogin() {
        navigateStartToOnBoarding()
        swipeLeft()
        swipeLeft()
        buttons["Proceed"].tap()
//        XCTAssert(application.staticTexts["Welcome to Musico"].exists)
    }
}
