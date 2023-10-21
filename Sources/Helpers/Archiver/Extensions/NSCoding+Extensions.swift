//
//  NSCoding+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension NSCoding where Self: NSObject {
    public func archive(
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(self, outputFormat: outputFormat, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> Result<Self, Error> {
        NSKeyedUnarchiver.unarchive(data, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> Self? {
        unarchive(data, forKey: key).value
    }
}

extension Array where Element: NSObject & NSCoding {
    public func archive(
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(self, outputFormat: outputFormat, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> Result<[Element], Error> {
        NSKeyedUnarchiver.unarchive(data, forKey: key)
    }

    public static func unarchive(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> [Element]? {
        unarchive(data, forKey: key).value
    }
}
