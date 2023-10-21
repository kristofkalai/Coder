//
//  NSCoder+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension NSCoder {
    public func encode<T: RawRepresentable>(_ object: Any?, forKey key: T) where T.RawValue == String {
        encode(object, forKey: key.rawValue)
    }

    public func encode(encode: (NSCoder) -> Void) {
        encode(self)
    }
}

extension NSCoder {
    public func decode<T: RawRepresentable>(forKey key: T) -> Any? where T.RawValue == String {
        decodeObject(forKey: key.rawValue)
    }

    public func decode<T: RawRepresentable, S>(forKey key: T) -> S? where T.RawValue == String {
        decode(forKey: key) as? S
    }

    public func decode<T: RawRepresentable, S: NSObject & NSCoding>(of class: S.Type, forKey key: T) -> S? where T.RawValue == String {
        decodeObject(of: S.self, forKey: key.rawValue)
    }

    @available(iOS 14.0, macOS 11.0, *)
    public func decodeArray<T: RawRepresentable, S: NSObject & NSSecureCoding>(forKey key: T) -> [S]? where T.RawValue == String {
        decodeArrayOfObjects(ofClass: S.self, forKey: key.rawValue)
    }
}
