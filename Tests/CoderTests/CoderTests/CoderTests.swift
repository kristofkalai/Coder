//
//  CoderTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class CoderTests: XCTestCase {
    private let coder = Coder()
}

extension CoderTests {
    func testJSONSuccessfulEncodingDecoding() {
        let object = firstCodableBook
        let encodedObject: Data? = coder.encode(object, type: .json)
        let decodedObject: CodableBook? = coder.decode(encodedObject, type: .json)
        XCTAssertEqual(decodedObject, object)
    }

    func testJSONFailedEncoding() {
        let object = codableBookWithInvalidPrice
        let encodedObject: Data? = coder.encode(object, type: .json)
        XCTAssertNil(encodedObject)
    }

    func testJSONFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodableBook? = coder.decode(data, type: .json)
        XCTAssertNil(decodedObject)
    }

    func testJSONFailedDecoding() {
        let data = Data()
        let decodedObject: CodableBook? = coder.decode(data, type: .json)
        XCTAssertNil(decodedObject)
    }
}

extension CoderTests {
    func testPropertyListSuccessfulEncodingDecoding() {
        let object = firstCodableBook
        let encodedObject: Data? = coder.encode(object, type: .propertyList)
        let decodedObject: CodableBook? = coder.decode(encodedObject, type: .propertyList)
        XCTAssertEqual(decodedObject, object)
    }

    func testPropertyListFailedEncoding() {
        let object = "invalidObject"
        let encodedObject: Data? = coder.encode(object, type: .propertyList)
        XCTAssertNil(encodedObject)
    }

    func testPropertyListFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodableBook? = coder.decode(data, type: .propertyList)
        XCTAssertNil(decodedObject)
    }

    func testPropertyListFailedDecoding() {
        let data = Data()
        let decodedObject: CodableBook? = coder.decode(data, type: .propertyList)
        XCTAssertNil(decodedObject)
    }
}

extension CoderTests {
    func testArchiveSuccessfulEncodingDecoding() {
        let object = firstCodingBook
        let encodedObject: Data? = coder.encode(object, type: .archive)
        let decodedObject: CodingBook? = coder.decode(encodedObject, type: .archive)
        XCTAssertEqual(decodedObject, object)
    }

    func testArchiveFailedDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: CodingBook? = coder.decode(data, type: .archive)
        XCTAssertNil(decodedObject)
    }

    func testArchiveFailedDecoding() {
        let data = Data()
        let decodedObject: CodingBook? = coder.decode(data, type: .archive)
        XCTAssertNil(decodedObject)
    }
}

extension CoderTests {
    func testArchiveSuccessfulArrayEncodingDecoding() {
        let object = [firstCodingBook, secondCodingBook]
        let encodedObject: Data? = coder.encode(object, type: .archive)
        let decodedObject: [CodingBook]? = coder.decode(encodedObject, type: .archive)
        XCTAssertEqual(decodedObject, object)
    }

    func testArchiveFailedArrayDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: [CodingBook]? = coder.decode(data, type: .archive)
        XCTAssertNil(decodedObject)
    }

    func testArchiveFailedArrayDecoding() {
        let data = Data()
        let decodedObject: [CodingBook]? = coder.decode(data, type: .archive)
        XCTAssertNil(decodedObject)
    }
}

extension CoderTests {
    func testArchiveSuccessfulSecureEncodingDecoding() {
        let object = firstSecureCodingBook
        let encodedObject: Data? = coder.encode(object, type: .secureArchive)
        let decodedObject: SecureCodingBook? = coder.decode(encodedObject, type: .secureArchive)
        XCTAssertEqual(decodedObject, object)
    }

    func testArchiveFailedSecureDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: SecureCodingBook? = coder.decode(data, type: .secureArchive)
        XCTAssertNil(decodedObject)
    }

    func testArchiveFailedSecureDecoding() {
        let data = Data()
        let decodedObject: SecureCodingBook? = coder.decode(data, type: .secureArchive)
        XCTAssertNil(decodedObject)
    }
}

extension CoderTests {
    func testArchiveSuccessfulSecureArrayEncodingDecoding() {
        let object = [firstSecureCodingBook, secondSecureCodingBook]
        let encodedObject: Data? = coder.encode(object, type: .secureArchive)
        let decodedObject: [SecureCodingBook]? = coder.decode(encodedObject, type: .secureArchive)
        XCTAssertEqual(decodedObject, object)
    }

    func testArchiveFailedSecureArrayDecodingInvalidInput() {
        let data: Data? = nil
        let decodedObject: [SecureCodingBook]? = coder.decode(data, type: .secureArchive)
        XCTAssertNil(decodedObject)
    }

    func testArchiveFailedSecureArrayDecoding() {
        let data = Data()
        let decodedObject: [SecureCodingBook]? = coder.decode(data, type: .secureArchive)
        XCTAssertNil(decodedObject)
    }
}
