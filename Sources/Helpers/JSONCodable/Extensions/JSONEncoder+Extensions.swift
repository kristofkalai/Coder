//
//  JSONEncoder+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension JSONEncoder {
    public static func encode<T: Encodable>(
        _ object: T?,
        outputFormatting: JSONEncoder.OutputFormatting = [],
        dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
        dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
        nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
        keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<Data, Error> {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = outputFormatting
            encoder.dateEncodingStrategy = dateEncodingStrategy
            encoder.dataEncodingStrategy = dataEncodingStrategy
            encoder.nonConformingFloatEncodingStrategy = nonConformingFloatEncodingStrategy
            encoder.keyEncodingStrategy = keyEncodingStrategy
            encoder.userInfo = userInfo
            let result = try encoder.encode(object)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    public static func encode<T: Encodable>(
        _ object: T?,
        outputFormatting: JSONEncoder.OutputFormatting = [],
        dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
        dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
        nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
        keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Data? {
        encode(object,
               outputFormatting: outputFormatting,
               dateEncodingStrategy: dateEncodingStrategy,
               dataEncodingStrategy: dataEncodingStrategy,
               nonConformingFloatEncodingStrategy: nonConformingFloatEncodingStrategy,
               keyEncodingStrategy: keyEncodingStrategy,
               userInfo: userInfo).value
    }
}
