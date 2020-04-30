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
        if self.buttons["dashboardToProfile"].exists {
            self.buttons["dashboardToProfile"].tap()
            sleep(1)
            self.buttons["Log Out"].tap()
            self.buttons["OK"].tap()
        }
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
        if !self.buttons["dashboardToProfile"].exists {
            navigateStartToLogin()
            login()
            sleep(1)
        }
    }

    func navigateToSearchScreen() {
        navigateToDashboard()
        buttons["Search"].tap()
    }

    func navigateToPlaylists() {
        navigateToDashboard()
        buttons["Playlists"].tap()
    }

    func navigateToProfile() {
        XCUIDevice.shared.orientation = .portrait
        navigateToDashboard()
        self.buttons["dashboardToProfile"].tap()
        sleep(1)
    }

    func login() {
        textFields["E-mail"].tap()
        textFields["E-mail"].typeText("nate@gmail.com")
        keyboards.buttons["return"].tap()
        UIPasteboard.general.string = "12345678"
        secureTextFields["Password"].doubleTap()
        sleep(2)
        menuItems["Paste"].tap()
        sleep(1)
        buttons["Login"].tap()
        sleep(2)
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
