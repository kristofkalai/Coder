//
//  JSONCoder.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

public final class JSONCoder {
    public init() {}
}

extension JSONCoder {
    public func encode<T: Encodable>(
        _ object: T?,
        outputFormatting: JSONEncoder.OutputFormatting = [],
        dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
        dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
        nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
        keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<Data, Error> {
        JSONEncoder.encode(
            object,
            outputFormatting: outputFormatting,
            dateEncodingStrategy: dateEncodingStrategy,
            dataEncodingStrategy: dataEncodingStrategy,
            nonConformingFloatEncodingStrategy: nonConformingFloatEncodingStrategy,
            keyEncodingStrategy: keyEncodingStrategy,
            userInfo: userInfo
        )
    }

    public func encode<T: Encodable>(
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

extension JSONCoder {
    public func decode<T: Decodable>(
        _ data: Data?,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .base64,
        nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy = .throw,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:],
        allowsJSON5: Bool = false,
        assumesTopLevelDictionary: Bool = false
    ) -> Result<T, Error> {
        JSONDecoder.decode(
            data,
            dateDecodingStrategy: dateDecodingStrategy,
            dataDecodingStrategy: dataDecodingStrategy,
            nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy,
            keyDecodingStrategy: keyDecodingStrategy,
            userInfo: userInfo,
            allowsJSON5: allowsJSON5,
            assumesTopLevelDictionary: assumesTopLevelDictionary
        )
    }

    public func decode<T: Decodable>(
        _ data: Data?,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .base64,
        nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy = .throw,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:],
        allowsJSON5: Bool = false,
        assumesTopLevelDictionary: Bool = false
    ) -> T? {
        decode(data,
               dateDecodingStrategy: dateDecodingStrategy,
               dataDecodingStrategy: dataDecodingStrategy,
               nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy,
               keyDecodingStrategy: keyDecodingStrategy,
               userInfo: userInfo,
               allowsJSON5: allowsJSON5,
               assumesTopLevelDictionary: assumesTopLevelDictionary).value
    }
}
