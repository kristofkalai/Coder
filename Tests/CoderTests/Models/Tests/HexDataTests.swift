//
//  HexDataTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class HexDataTests: XCTestCase {}

extension HexDataTests {
    func testHexData() {
        let object = firstCodingBook
        let encodedData: Data = object.archive()
        let hexData = HexData(data: encodedData)
        let hexDataString = HexData(string: hexData.string)
        let encodedTransformedData = hexDataString.data
        let decodedData: CodingBook? = .unarchive(encodedTransformedData)
        XCTAssertEqual(object, decodedData)
    }
}
