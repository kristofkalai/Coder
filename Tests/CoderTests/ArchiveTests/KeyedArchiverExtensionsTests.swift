//
//  KeyedArchiverExtensionsTests.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class KeyedArchiverExtensionsTests: XCTestCase {
    private let encoder = NSKeyedArchiver.self
    private let decoder = NSKeyedUnarchiver.self
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulEncodingDecodingWithCoder() {
        let object = firstCodingBook
        let encodedObject: Data? = encoder.archive(object)
        let decodedObject: CodingBook? = decoder.unarchive(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedDecodingInvalidInputWithCoder() {
        let data: Data? = nil
        let decodedObject: CodingBook? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedDecodingWithCoder() {
        let data = Data()
        let decodedObject: CodingBook? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulEncodingDecoding() {
        let object = firstCodingBook
        let encodedObject: Data? = object.archive()
        let decodedObject: CodingBook? = .unarchive(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodingBook? = .unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedDecoding() {
        let data = Data()
        let decodedObject: CodingBook? = .unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulSecureEncodingDecodingWithCoder() {
        let object = firstSecureCodingBook
        let encodedObject: Data? = encoder.archive(object, requiringSecureCoding: true)
        let decodedObject: SecureCodingBook? = decoder.unarchive(encodedObject, requiringSecureCoding: true)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedSecureDecodingInvalidInputWithCoder() {
        let data: Data? = nil
        let decodedObject: SecureCodingBook? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedSecureDecodingWithCoder() {
        let data = Data()
        let decodedObject: SecureCodingBook? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulSecureEncodingDecoding() {
        let object = firstSecureCodingBook
        let encodedObject: Data? = object.archive()
        let decodedObject: SecureCodingBook? = .unarchive(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedSecureDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: SecureCodingBook? = SecureCodingBook.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedSecureDecoding() {
        let data = Data()
        let decodedObject: SecureCodingBook? = SecureCodingBook.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulArrayEncodingDecodingWithCoder() {
        let object = [firstCodingBook, secondCodingBook]
        let encodedObject: Data? = encoder.archive(object)
        let decodedObject: [CodingBook]? = decoder.unarchive(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedArrayDecodingInvalidInputWithCoder() {
        let data: Data? = nil
        let decodedObject: [CodingBook]? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedArrayDecodingWithCoder() {
        let data = Data()
        let decodedObject: [CodingBook]? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulArrayEncodingDecoding() {
        let object = [firstCodingBook, secondCodingBook]
        let encodedObject: Data? = object.archive()
        let decodedObject: [CodingBook]? = .unarchive(encodedObject)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedArrayDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: [CodingBook]? = .unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedArrayDecoding() {
        let data = Data()
        let decodedObject: [CodingBook]? = .unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulSecureArrayEncodingDecodingWithCoder() {
        let object = [firstSecureCodingBook, secondSecureCodingBook]
        let encodedObject: Data? = encoder.archive(object, requiringSecureCoding: true)
        let decodedObject: [SecureCodingBook]? = decoder.unarchive(encodedObject, requiringSecureCoding: true)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedSecureArrayDecodingInvalidInputWithCoder() {
        let data: Data? = nil
        let decodedObject: [SecureCodingBook]? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedSecureArrayDecodingWithCoder() {
        let data = Data()
        let decodedObject: [SecureCodingBook]? = decoder.unarchive(data)
        XCTAssertNil(decodedObject)
    }
}

extension KeyedArchiverExtensionsTests {
    func testSuccessfulSecureArrayEncodingDecoding() {
        let object = [firstSecureCodingBook, secondSecureCodingBook]
        let encodedObject: Data? = object.archive(requiringSecureCoding: true)
        let decodedObject: [SecureCodingBook]? = .unarchive(encodedObject, requiringSecureCoding: true)
        XCTAssertEqual(decodedObject, object)
    }

    func testFailedSecureArrayDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: [SecureCodingBook]? = .unarchive(data)
        XCTAssertNil(decodedObject)
    }

    func testFailedSecureArrayDecoding() {
        let data = Data()
        let decodedObject: [SecureCodingBook]? = .unarchive(data)
        XCTAssertNil(decodedObject)
    }
}
