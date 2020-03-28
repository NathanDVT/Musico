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
    }

//    func testGivenArtistNameThenConstructViewModelObject() {
//        let artistMediaViewModel = ArtistMediaViewModel(artistName: "drake")
//        XCTAssertNotNil(artistMediaViewModel)
//    }
//
//    func testGivenCorrectArtistNameThenReturnSuccessfullCollection() {
//        do {
//            repo.getArtistMedia { /*[weak self]*/ result in
//                XCTAssertNotNil(result)
//                switch result {
//                case .success(let cols):
//                    XCTAssertGreaterThan(cols.count, 0)
//                case .failure(let error):
//                    print(error)
//                    XCTAssertFalse(true)
//                }
//            }
//        }
//    }
}
