//
//  DashboardHomeModelViewTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/30.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import NLibrary

class ProfileViewModelTest: XCTestCase {

    var systemUnderTest: ProfileViewModel!
    var mockRepo: ProfileMockRepo!
    var mockViewController: ProfileMockViewController!

    override func setUp() {
        mockViewController = ProfileMockViewController()
        mockRepo = ProfileMockRepo()
        systemUnderTest = ProfileViewModel(viewController: mockViewController,
                                             repo: mockRepo)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetUserProfileSuccessfulRequestDelegatesDTOtoViewController() {
        let expectedValue: NSDictionary = [
            "gender": Gender.male.stringValue,
            "name": "name",
            "email": "email",
            "noPlaylists": 2
        ]
        systemUnderTest.getUserProfile()
        let outcome = self.mockViewController.profileModel.dict as NSDictionary
        XCTAssert(expectedValue.isEqual(outcome))
    }

    func testGetUserProfileUnsuccessfulRequestDelegatesDTOtoViewController() {
        let expectedValue: String = "failed getUserProfile"
        mockRepo.closurePathway = .failedRequest(message: "")
        systemUnderTest.getUserProfile()
        let outcome = self.mockViewController.failedRequestMessage
        XCTAssert(expectedValue.isEqual(outcome))
    }

    func testLogoutSuccessfulRequestDelegatesCalltoViewController() {
        let expectedValue: Bool = true
        systemUnderTest.logoutRequest()
        let outcome = self.mockViewController.succesfulLogoutCalled
        XCTAssert(expectedValue == outcome)
    }

    func testLogoutFailedRequestDelegatesMessagetoViewController() {
        let expectedValue: String = "failed logoutRequest"
        mockRepo.closurePathway = .failedRequest(message: "")
        systemUnderTest.logoutRequest()
        let outcome = self.mockViewController.failedLogoutMessage
        XCTAssert(expectedValue.isEqual(outcome))
    }

}
