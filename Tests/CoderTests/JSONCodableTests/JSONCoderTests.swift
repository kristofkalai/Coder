//
//  JSONCoderTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class JSONCoderTests: XCTestCase {
    private let coder = JSONCoder()
}

extension JSONCoderTests {
    func testSuccessfulEncodingDecoding() {
        let object = firstCodableBook
        let encodedObject: Data? = coder.encode(object)
        let decodedObject: CodableBook? = coder.decode(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedEncoding() {
        let object = codableBookWithInvalidPrice
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
