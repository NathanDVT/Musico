//
//  SignUpRepoTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/30.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import NLibrary

class SignUpRepoTest: XCTestCase {
    var systemUnderTest: SignUpRepo!
    var mockViewModel: SignUpMockViewModel!
    var mockViewController: SignUpMockViewController!
    var mockService: FirebaseServiceMock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockViewController = SignUpMockViewController()
        systemUnderTest = SignUpRepo()
        mockViewModel = SignUpMockViewModel(viewController: mockViewController,
                                            signUpRepo: systemUnderTest)
        systemUnderTest.setViewModel(userVM: mockViewModel)
        mockService = FirebaseServiceMock(repo: systemUnderTest)
        systemUnderTest.setServiceProvider(service: mockService)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenErrorMessageToViewModelDelegationSuccessfullyCallled() {
        let expected: String = "Error Message"
        systemUnderTest.failedSignUp(errorMessage: "Error Message")
        XCTAssert(mockViewModel.errorMessage.elementsEqual(expected))
    }

    func testSuccessfulDelegationOfSuccessfulEvent() {
        let expected: Bool = true
        systemUnderTest.successfulSignUp()
        XCTAssert(mockViewModel.successfulRequestCalled == expected)
    }

    func testSuccessfulEmailAndPasswordSubmission() {
        let expectedEmail: String = "pjwelcome@dvt.com"
        let expectedPassWord: String = "password"
        systemUnderTest.signUpAndAddNewUser(email: expectedEmail, password: expectedPassWord)
        XCTAssert(mockService.email == expectedEmail)
        XCTAssert(mockService.password == expectedPassWord)
    }
}
