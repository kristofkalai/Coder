//
//  PropertyListCoder.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

public final class PropertyListCoder {
    public init() {}
}

extension PropertyListCoder {
    public func encode<T: Encodable>(
        _ object: T?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<Data, Error> {
        PropertyListEncoder.encode(object, format: format, userInfo: userInfo)
    }

    public func encode<T: Encodable>(
        _ object: T?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Data? {
        encode(object, format: format, userInfo: userInfo).value
    }
}

extension PropertyListCoder {
    public func decode<T: Decodable>(
        _ data: Data?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<T, Error> {
        PropertyListDecoder.decode(data, format: format, userInfo: userInfo)
    }

    public func decode<T: Decodable>(
        _ data: Data?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> T? {
        decode(data, format: format, userInfo: userInfo).value
    }
}
