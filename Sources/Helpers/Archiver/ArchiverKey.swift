//
//  ArchiverKey.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

public enum ArchiverKey {
    case string(String)
    case root

    var value: String {
        switch self {
        case let .string(string): return string
        case .root: return NSKeyedArchiveRootObjectKey
        }
    }
}

extension ArchiverKey: RawRepresentable {
    public var rawValue: String {
        value
    }

    public init(rawValue: String) {
        switch rawValue {
        case ArchiverKey.root.rawValue: self = .root
        default: self = .string(rawValue)
        }
    }
}

extension ArchiverKey: Equatable {}
