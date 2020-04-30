//
//  DashboardHomeModelViewTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/30.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import NLibrary

class DashboardHomeModelViewTest: XCTestCase {

    var systemUnderTest: DashboardViewModel!
    var mockRepo: DashboardMockRepo!
    var mockViewController: DashboardMockViewController!
    var mockService: FirebaseServiceMock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockViewController = DashboardMockViewController()
        mockRepo = DashboardMockRepo()
        systemUnderTest = DashboardViewModel(viewController: mockViewController,
                                             repo: mockRepo)
        //systemUnderTest.setViewModel(viewModel: mockViewModel)
        //mockService = FirebaseServiceMock(repo: systemUnderTest)
        //systemUnderTest.setServiceProvider(service: mockService)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
