//
//  PropertyListEncoder+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension PropertyListEncoder {
    public static func encode<T: Encodable>(
        _ object: T?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<Data, Error> {
        do {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = format
            encoder.userInfo = userInfo
            let result = try encoder.encode(object)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    public static func encode<T: Encodable>(
        _ object: T?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Data? {
        encode(object, format: format, userInfo: userInfo).value
    }
}
