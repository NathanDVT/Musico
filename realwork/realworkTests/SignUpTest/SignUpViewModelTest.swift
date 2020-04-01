//
//  SignUpViewModelTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/30.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import NLibrary

class SignUpViewModelTest: XCTestCase {
    var systemUnderTest: SignUpViewModel!
    var mockRepo: SignUpMockRepo!
    var mockViewController: SignUpMockViewController!
    var mockService: FirebaseServiceMock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.mockRepo = SignUpMockRepo()
        self.mockViewController = SignUpMockViewController()
        self.systemUnderTest =  SignUpViewModel(viewController: mockViewController, signUpRepo: mockRepo)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGivenEmailAndPasswordCorrectDelegationOfVariables() {
        let expectedEmail: String = "email@email.com"
        let expectedPassword: String = "passWORD"
        XCTAssertFalse(expectedEmail.elementsEqual(mockRepo.email))
        XCTAssertFalse(expectedPassword.elementsEqual(mockRepo.password))
        self.systemUnderTest.signUp(email: expectedEmail, password: expectedPassword)
        XCTAssert(expectedEmail.elementsEqual(mockRepo.email))
        XCTAssert(expectedPassword.elementsEqual(mockRepo.password))
    }

    func testSuccessfulRequestDelegation() {
        let expected: Bool = true
        XCTAssertFalse(self.mockViewController.successfulSignInCalled)
        self.systemUnderTest.successfullRequest()
        XCTAssert(self.mockViewController.successfulSignInCalled == expected)
    }

    func testUnsuccessfulRequestMessageDelegation() {
        let expected: String = "Cannot delegate"
        XCTAssertFalse(self.mockViewController.unsuccessMessage.elementsEqual(expected))
        self.systemUnderTest.unsuccessfulRequest(errorMessage: expected)
        XCTAssert(self.mockViewController.unsuccessMessage.elementsEqual(expected))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
