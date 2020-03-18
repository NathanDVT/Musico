//
//  ArtistMediaViewModelTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/09.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import NLibrary

class ArtistMediaViewModelTest: XCTestCase {
    var repo: ArtistMediaRepoProtocol!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        do {
            repo = try ArtistMediaRepoMock(artistName: "drake")
        } catch {}
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenArtistNameThenConstructViewModelObject() {
        let artistMediaViewModel = ArtistMediaViewModel(artistName: "drake")
        XCTAssertNotNil(artistMediaViewModel)
    }

    func testGivenCorrectArtistNameThenReturnSuccessfullCollection() {
//        let expectation1 = expectation(description: "First Expectation")
        do {
            repo.getArtistMedia { [weak self] result in
                XCTAssertNotNil(result)
                switch result {
                case .success(let cols):
                    XCTAssertGreaterThan(cols.count, 0)
                case .failure(let error):
                    print(error)
                    XCTAssertFalse(true)
                }
//                expectation1.fulfill()
            }
//            waitForExpectations(timeout: 3)
        } catch {XCTAssertTrue(false)}
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
