//
//  NSSecureCoding+Extensions.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension NSSecureCoding where Self: NSObject {
    public func archive(
        requiringSecureCoding: Bool = true,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(self, requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> Result<Self, Error> {
        NSKeyedUnarchiver.unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> Self? {
        unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key).value
    }
}

extension Array where Element: NSObject & NSSecureCoding {
    public func archive(
        requiringSecureCoding: Bool = true,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(self, requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> Result<[Element], Error> {
        NSKeyedUnarchiver.unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> [Element]? {
        unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key).value
    }
}
