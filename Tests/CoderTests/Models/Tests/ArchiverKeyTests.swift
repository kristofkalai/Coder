//
//  ArchiverKeyTests.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import XCTest
import Coder

final class ArchiverKeyTests: XCTestCase {}

extension ArchiverKeyTests {
    func testStringArchiverKey() {
        let value = "stringKey"
        let archiverKey: ArchiverKey = .string(value)
        XCTAssertEqual(archiverKey, .init(rawValue: value))
    }

    func testRootArchiverKey() {
        let value: ArchiverKey = .root
        let archiverKey = value
        XCTAssertEqual(archiverKey, .init(rawValue: value.rawValue))
    }
}
