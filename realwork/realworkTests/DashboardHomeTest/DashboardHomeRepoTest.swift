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

    func testGivenDictionaryWithKeyNameSuccessfullyExtractAndDelegateName() {
        let expected: String = "testName"
        let dictParams: NSDictionary = ["name": expected]
        XCTAssertFalse(mockViewModel.userName == expected)
        systemUnderTest.successFulNameRequest(dictionary: dictParams)
        XCTAssert(mockViewModel.userName == expected)
    }

//    func testGivenDictionaryWithPlaylistRequestSuccessfulExtractAndDelegate() {
//        let expected1 = "A name",
//        expected2 = "previewUrlB",
//        expected3 = "titleA"
//        var song1 = RecentSongModel()
//        var song2 = RecentSongModel()
//        song1.artistName = expected1
//        song2.previewUrl = expected2
//        song1.titleName = expected3
//        var array: [RecentSongModel] = [RecentSongModel]()
//        array.append(song1)
//        array.append(song2)
//        let values: [String: Any] = [
//            "UniqueIdA": array[0].dict,
//            "UniqueIdB": array[1].dict
//        ]
//
//        let playlist = values as NSDictionary
//        systemUnderTest.successFulRecentPlaylistRequest(dictionary: playlist)
//        sleep(1)
//        XCTAssert(mockViewModel.testRecentSongModels[0].artistName == expected1)
//        XCTAssert(mockViewModel.testRecentSongModels[1].previewUrl == expected2)
//        XCTAssert(mockViewModel.testRecentSongModels[0].titleName == expected3)
//    }
}
