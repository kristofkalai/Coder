//
//  PropertyListCodableExtensionsTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class PropertyListCodableExtensionsTests: XCTestCase {
    private let encoder = PropertyListEncoder.self
    private let decoder = PropertyListDecoder.self
}

extension PropertyListCodableExtensionsTests {
    func testSuccessfulEncodingDecodingWithCoder() {
        let object = firstCodableBook
        let encodedObject: Data? = encoder.encode(object)
        let decodedObject: CodableBook? = decoder.decode(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedEncodingWithCoder() {
        let object = "invalidObject"
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

extension PropertyListCodableExtensionsTests {
    func testSuccessfulEncodingDecoding() {
        let object = firstCodableBook
        let encodedObject: Data? = object.encodePlist()
        let decodedObject: CodableBook? = .decodePlist(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedEncoding() {
        let object = "invalidObject"
        let encodedObject: Data? = object.encodePlist()
        XCTAssertNil(encodedObject)
    }

    func testFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodableBook? = .decodePlist(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedDecoding() {
        let data = Data()
        let decodedObject: CodableBook? = .decodePlist(data)
        XCTAssertNil(decodedObject)
    }
}
