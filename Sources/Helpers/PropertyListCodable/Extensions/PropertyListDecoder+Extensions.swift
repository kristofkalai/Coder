//
//  PropertyListDecoder+Extensions.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension PropertyListDecoder {
    public static func decode<T: Decodable>(
        _ data: Data?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<T, Error> {
        do {
            guard let data else {
                throw CodingError.DecodingError.invalidInput
            }
            let decoder = PropertyListDecoder()
            var format = format
            let result = try decoder.decode(T.self, from: data, format: &format)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    public static func decode<T: Decodable>(
        _ data: Data?,
        format: PropertyListSerialization.PropertyListFormat = .binary,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> T? {
        decode(data, format: format, userInfo: userInfo).value
    }
}
