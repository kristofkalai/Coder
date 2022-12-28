//
//  KeyedArchiverTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class KeyedArchiverTests: XCTestCase {
    private let coder = KeyedArchiver()
}

extension KeyedArchiverTests {
    func testSuccessfulEncodingDecoding() {
        let object = firstCodingBook
        let encodedObject: Data? = coder.archive(object)
        let decodedObject: CodingBook? = coder.unarchive(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodingBook? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedDecoding() {
        let data = Data()
        let decodedObject: CodingBook? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverTests {
    func testSuccessfulSecureEncodingDecoding() {
        let object = firstSecureCodingBook
        let encodedObject: Data? = coder.archive(object, requiringSecureCoding: true)
        let decodedObject: SecureCodingBook? = coder.unarchive(encodedObject, requiringSecureCoding: true)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedSecureDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: SecureCodingBook? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedSecureDecoding() {
        let data = Data()
        let decodedObject: SecureCodingBook? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverTests {
    func testSuccessfulArrayEncodingDecoding() {
        let object = [firstCodingBook, secondCodingBook]
        let encodedObject: Data? = coder.archive(object)
        let decodedObject: [CodingBook]? = coder.unarchive(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedArrayDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: [CodingBook]? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedArrayDecoding() {
        let data = Data()
        let decodedObject: [CodingBook]? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverTests {
    func testSuccessfulSecureArrayEncodingDecoding() {
        let object = [firstSecureCodingBook, secondSecureCodingBook]
        let encodedObject: Data? = coder.archive(object, requiringSecureCoding: true)
        let decodedObject: [SecureCodingBook]? = coder.unarchive(encodedObject, requiringSecureCoding: true)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedSecureArrayDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: [SecureCodingBook]? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedSecureArrayDecoding() {
        let data = Data()
        let decodedObject: [SecureCodingBook]? = coder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}
