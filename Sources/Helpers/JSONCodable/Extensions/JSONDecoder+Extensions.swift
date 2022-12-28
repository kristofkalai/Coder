//
//  JSONDecoder+Extensions.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension JSONDecoder {
    public static func decode<T: Decodable>(
        _ data: Data?,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .base64,
        nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy = .throw,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        userInfo: [CodingUserInfoKey: Any] = [:],
        allowsJSON5: Bool = false,
        assumesTopLevelDictionary: Bool = false
    ) -> Result<T, Error> {
        do {
            guard let data else {
                throw CodingError.DecodingError.invalidInput
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.dataDecodingStrategy = dataDecodingStrategy
            decoder.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            decoder.userInfo = userInfo
            if #available(iOS 15.0, *) {
                decoder.assumesTopLevelDictionary = assumesTopLevelDictionary
                decoder.allowsJSON5 = allowsJSON5
            }
            let result = try decoder.decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    public static func decode<T: Decodable>(
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
