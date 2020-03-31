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

    func testGivenInvalidIndexNoSongShouldBePlayed() {
        let expected: Int = -1
        XCTAssert(systemUnderTest.currentPlayingIndex == expected)
        systemUnderTest.playRecentSongAt(index: 0)
        XCTAssert(systemUnderTest.currentPlayingIndex == expected)
    }

    // TO DO: string length too long, read from JSON file
//    func testGivenValidIndexSongShouldBePlayed() {
//        var testData = RecentSong()
//        testData.artistName = "Drake"
//        testData.titleName = "One Dance (feat. Wizkid & Kyla)"
//        testData.previewUrl =
//        """
//https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview118/v4/ae/bb/1
//    9/aebb1987-6bd0-2e36-9c50-a9938e8fd6b2/mzaf_1593958342331534737.plus.aac.p.m4a
//        """
//        systemUnderTest.recentPlayedList.append(testData)
//        let expected: Int = 0
//        XCTAssertFalse(systemUnderTest.currentPlayingIndex == expected)
//        systemUnderTest.playRecentSongAt(index: 0)
//        XCTAssert(systemUnderTest.currentPlayingIndex == expected)
//    }
}
