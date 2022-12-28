//
//  JSONCodableExtensionsTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class JSONCodableExtensionsTests: XCTestCase {
    private let encoder = JSONEncoder.self
    private let decoder = JSONDecoder.self
}

extension JSONCodableExtensionsTests {
    func testSuccessfulEncodingDecodingWithCoder() {
        let object = firstCodableBook
        let encodedObject: Data? = encoder.encode(object)
        let decodedObject: CodableBook? = decoder.decode(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedEncodingWithCoder() {
        let object = codableBookWithInvalidPrice
        let encodedObject: Data? = encoder.encode(object)
        XCTAssertNil(encodedObject)
    }

    func testFailedDecodingInvalidInputWithCoder() {
        let data: Data? = nil
        let decodedObject: CodableBook? = decoder.decode(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedDecodingWithCoder() {
        let data = Data()
        let decodedObject: CodableBook? = decoder.decode(data)
        XCTAssertNil(decodedObject)
    }
}

extension JSONCodableExtensionsTests {
    func testSuccessfulEncodingDecoding() {
        let object = firstCodableBook
        let encodedObject: Data? = object.encode()
        let decodedObject: CodableBook? = .decode(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedEncoding() {
        let object = codableBookWithInvalidPrice
        let encodedObject: Data? = object.encode()
        XCTAssertNil(encodedObject)
    }

    func testFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodableBook? = .decode(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedDecoding() {
        let data = Data()
        let decodedObject: CodableBook? = .decode(data)
        XCTAssertNil(decodedObject)
    }
}
