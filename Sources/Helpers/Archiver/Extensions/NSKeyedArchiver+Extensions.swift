//
//  NSKeyedArchiver+Extensions.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension NSKeyedArchiver {
    public static func archive<T: NSObject & NSSecureCoding>(
        _ object: T?,
        requiringSecureCoding: Bool = true,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver
            .create(requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat)
            .encoded(object, forKey: key)
    }

    public static func archive<T: NSObject & NSCoding>(
        _ object: T?,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver
            .create(requiringSecureCoding: false, outputFormat: outputFormat)
            .encoded(object, forKey: key)
    }

    public static func archive<T: NSObject & NSSecureCoding>(
        _ object: [T]?,
        requiringSecureCoding: Bool = true,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver
            .create(requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat)
            .encoded(object, forKey: key)
    }

    public static func archive<T: NSObject & NSCoding>(
        _ object: [T]?,
        outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
        forKey key: ArchiverKey = .root
    ) -> Data {
        NSKeyedArchiver
            .create(requiringSecureCoding: false, outputFormat: outputFormat)
            .encoded(object, forKey: key)
    }
}

extension NSKeyedArchiver {
    public static func create(
        requiringSecureCoding: Bool,
        outputFormat: PropertyListSerialization.PropertyListFormat
    ) -> NSKeyedArchiver {
        let archiver = NSKeyedArchiver(requiringSecureCoding: requiringSecureCoding)
        archiver.outputFormat = outputFormat
        return archiver
    }
}

extension NSKeyedArchiver {
    private func encoded(_ object: Any?, forKey key: ArchiverKey = .root) -> Data {
        encode(object, forKey: key.value)
        return encodedData
    }
}
