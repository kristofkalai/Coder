//
//  KeyedArchiver.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

public final class KeyedArchiver {
    public init() {}
}

extension KeyedArchiver {
    public func archive<T: NSObject & NSCoding>(
        _ object: T?,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(object, outputFormat: outputFormat, forKey: key)
    }

    public func archive<T: NSObject & NSCoding>(
        _ object: [T]?,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(object, outputFormat: outputFormat, forKey: key)
    }

    public func archive<T: NSObject & NSSecureCoding>(
        _ object: T?,
        requiringSecureCoding: Bool = true,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(object, requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat, forKey: key)
    }

    public func archive<T: NSObject & NSSecureCoding>(
        _ object: [T]?,
        requiringSecureCoding: Bool = true,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver.archive(object, requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat, forKey: key)
    }
}

extension KeyedArchiver {
    public func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> Result<T, Error> {
        NSKeyedUnarchiver.unarchive(data, forKey: key)
    }

    public func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> T? {
        unarchive(data, forKey: key).value
    }

    public func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> Result<[T], Error> {
        NSKeyedUnarchiver.unarchive(data, forKey: key)
    }

    public func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> [T]? {
        unarchive(data, forKey: key).value
    }

    public func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> Result<[T], Error> {
        NSKeyedUnarchiver.unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key)
    }

    public func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> [T]? {
        unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key).value
    }

    public func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> Result<T, Error> {
        NSKeyedUnarchiver.unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key)
    }

    public func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> T? {
        unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key).value
    }
}
