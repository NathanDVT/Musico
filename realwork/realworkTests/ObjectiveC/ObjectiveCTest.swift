//
//  DashboardHomeModelViewTest.swift
//  realworkTests
//
//  Created by Nathan Ngobale on 2020/03/30.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import XCTest
@testable import NLibrary
@testable import realwork

class ObjectiveCTest: XCTestCase {
    override func setUp() {
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenHexcodeRGBColorAreEqual() {
        let hexCol: UIColor = HexToUIColor(hexcode: "#000000ff").color
        let blackCol: UIColor = UIColor.black
        XCTAssert(compareColors(co1: hexCol, co2: blackCol))
    }
}
