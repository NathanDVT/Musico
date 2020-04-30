//
//  DashboardHomeRepoTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/30.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import NLibrary

class DashboardHomeRepoTest: XCTestCase {

    var systemUnderTest: DashboardRepo!
    var mockViewModel: DashboardMockViewModel!
    var mockViewController: DashboardMockViewController!
    var mockService: FirebaseServiceMock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockViewController = DashboardMockViewController()
        systemUnderTest = DashboardRepo()
        mockViewModel = DashboardMockViewModel(viewController: mockViewController,
                                           repo: systemUnderTest)
        systemUnderTest.setViewModel(viewModel: mockViewModel)
        mockService = FirebaseServiceMock(repo: systemUnderTest)
        systemUnderTest.setServiceProvider(service: mockService)
    }

    func testDelegationOfLoadContentToService() {
        let expected: Bool = true
        XCTAssertFalse(mockService.calledGetDashboardItems == expected)
        systemUnderTest.getDashboardContent()
        XCTAssert(mockService.calledGetDashboardItems == expected)
    }
}
