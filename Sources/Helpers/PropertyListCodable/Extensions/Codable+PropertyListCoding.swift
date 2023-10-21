//
//  Codable+PropertyListCoding.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension Encodable {
    public func encodePlist(
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<Data, Error> {
        PropertyListEncoder.encode(self, format: format, userInfo: userInfo)
    }

    public func encodePlist(
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Data? {
        encodePlist(format: format, userInfo: userInfo).value
    }
}

extension Decodable {
    public static func decodePlist(
        _ data: Data?,
        userInfo: [CodingUserInfoKey: Any] = [:],
        format: PropertyListSerialization.PropertyListFormat = .xml
    ) -> Result<Self, Error> {
        PropertyListDecoder.decode(data, format: format, userInfo: userInfo)
    }

    public static func decodePlist(
        _ data: Data?,
        userInfo: [CodingUserInfoKey: Any] = [:],
        format: PropertyListSerialization.PropertyListFormat = .xml
    ) -> Self? {
        decodePlist(data, userInfo: userInfo, format: format).value
    }
}
