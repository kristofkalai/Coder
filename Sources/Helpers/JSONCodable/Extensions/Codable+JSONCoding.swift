//
//  Codable+JSONCoding.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension Encodable {
    public func encode(
        outputFormatting: JSONEncoder.OutputFormatting = [],
        dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
        dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
        nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
        keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Result<Data, Error> {
        JSONEncoder.encode(
            self,
            outputFormatting: outputFormatting,
            dateEncodingStrategy: dateEncodingStrategy,
            dataEncodingStrategy: dataEncodingStrategy,
            nonConformingFloatEncodingStrategy: nonConformingFloatEncodingStrategy,
            keyEncodingStrategy: keyEncodingStrategy,
            userInfo: userInfo
        )
    }

    public func encode(
        outputFormatting: JSONEncoder.OutputFormatting = [],
        dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
        dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
        nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
        keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:]
    ) -> Data? {
        encode(outputFormatting: outputFormatting,
               dateEncodingStrategy: dateEncodingStrategy,
               dataEncodingStrategy: dataEncodingStrategy,
               nonConformingFloatEncodingStrategy: nonConformingFloatEncodingStrategy,
               keyEncodingStrategy: keyEncodingStrategy,
               userInfo: userInfo).value
    }
}

extension Decodable {
    public static func decode(
        _ data: Data?,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .base64,
        nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy = .throw,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:],
        allowsJSON5: Bool = false,
        assumesTopLevelDictionary: Bool = false
    ) -> Result<Self, Error> {
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

    public static func decode(
        _ data: Data?,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .base64,
        nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy = .throw,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:],
        allowsJSON5: Bool = false,
        assumesTopLevelDictionary: Bool = false
    ) -> Self? {
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
