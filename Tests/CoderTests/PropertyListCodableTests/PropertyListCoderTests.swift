//
//  PropertyListCoderTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class PropertyListCoderTests: XCTestCase {
    private let coder = PropertyListCoder()
}

extension PropertyListCoderTests {
    func testSuccessfulEncodingDecoding() {
        let object = firstCodableBook
        let encodedObject: Data? = coder.encode(object)
        let decodedObject: CodableBook? = coder.decode(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedEncoding() {
        let object = "invalidObject"
        let encodedObject: Data? = coder.encode(object)
        XCTAssertNil(encodedObject)
    }

    func testFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodableBook? = coder.decode(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedDecoding() {
        let data = Data()
        let decodedObject: CodableBook? = coder.decode(data)
        XCTAssertNil(decodedObject)
    }
}
