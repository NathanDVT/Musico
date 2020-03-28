//
//  ArtistMediaModelTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/06.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import realwork
@testable import NLibrary

//

class ArtistMediaRepoTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() {
//        let artistMediaResponse = Sa()
//        XCTAssertNotNil(artistMediaResponse)
//        let collection = SearchSongModel()
//        XCTAssertNotNil(collection)
//    }
//    //testGivenCorrectCredsWhenLoginIsCalledThenReturnSuccessfullReponse
//    func testGivenOneWordNamedArtistThenReturnSuccessfullUrl() {
//        let artistName: String = "Drake"
//        var artistMediaRepo: ArtistMediaRepo
//        do {
//            artistMediaRepo = try ArtistMediaRepo(artistName: artistName)
//            let expectedUrl: String = "https://itunes.apple.com/search?term=Drake"
//            XCTAssertEqual(artistMediaRepo.resourceURL.absoluteString, expectedUrl)
//        } catch {}
//    }
//
//    func testGivenInvalidNamedArtistThenReturnSuccessfullUrl() {
//        let artistName: String = "-102=1?]=-]-±&%&(@"
//        XCTAssertThrowsError( try ArtistMediaRepo(artistName: artistName) ) { error in
//            XCTAssertEqual(error as? ArtistMediaError, ArtistMediaError.invalidName)
//        }
//    }
//
//    func testGivenCorrectArtistNameThenReturnSuccessfullCollection() {
//        let artistName: String = "Drake"
//        var artistMediaRepo: ArtistMediaRepo
//        let expectation1 = expectation(description: "First Expectation")
//        do {
//            artistMediaRepo = try ArtistMediaRepo(artistName: artistName)
//            artistMediaRepo.getArtistMedia { /*[weak self]*/ result in
//                XCTAssertNotNil(result)
//                switch result {
//                case .success(let cols):
//                    XCTAssertGreaterThan(cols.count, 0)
//                default:
//                    XCTAssertFalse(true)
//                }
//                expectation1.fulfill()
//            }
//            waitForExpectations(timeout: 5)
//        } catch {XCTAssertTrue(false)}
//    }
//
//    func testGivenImpossibleArtistNameThenReturnSuccessfullEmptyCollection() {
//        let artistName: String = "DVTHASKH"
//        var artistMediaRepo: ArtistMediaRepo
//        let expectation1 = expectation(description: "First Expectation")
//        do {
//            artistMediaRepo = try ArtistMediaRepo(artistName: artistName)
//            artistMediaRepo.getArtistMedia { /*[weak self]*/ result in
//                XCTAssertNotNil(result)
//                switch result {
//                case .success(let cols):
//                    XCTAssertEqual(cols.count, 0)
//                default:
//                    XCTAssertFalse(true)
//                }
//                expectation1.fulfill()
//            }
//            waitForExpectations(timeout: 5)
//        } catch {XCTAssertTrue(false)}
//    }
}
