//
//  Coder.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

public final class Coder {
    public enum EncodableType {
        case json(outputFormatting: JSONEncoder.OutputFormatting = [],
                  dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
                  dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
                  nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
                  keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
                  userInfo: [CodingUserInfoKey: Any] = [:])
        case propertyList(format: PropertyListSerialization.PropertyListFormat = .binary,
                          userInfo: [CodingUserInfoKey: Any] = [:])

        public static var json: Self {
            .json()
        }

        public static var propertyList: Self {
            .propertyList()
        }
    }

    public enum EncodingType {
        case archive(outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
                     key: ArchiverKey = .root)

        public static var archive: Self {
            .archive()
        }
    }

    public enum SecureEncodingType {
        case secureArchive(requiringSecureCoding: Bool = true,
                           outputFormat: PropertyListSerialization.PropertyListFormat = .binary,
                           key: ArchiverKey = .root)

        public static var secureArchive: Self {
            .secureArchive()
        }
    }

    public enum DecodingType {
        case archive(key: ArchiverKey = .root)

        public static var archive: Self {
            .archive()
        }
    }

    public enum SecureDecodingType {
        case secureArchive(requiringSecureCoding: Bool = true,
                           key: ArchiverKey = .root)

        public static var secureArchive: Self {
            .secureArchive()
        }
    }

    public enum DecodableType {
        case json(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                  dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .base64,
                  nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy = .throw,
                  keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                  userInfo: [CodingUserInfoKey: Any] = [:],
                  allowsJSON5: Bool = false,
                  assumesTopLevelDictionary: Bool = false)
        case propertyList(format: PropertyListSerialization.PropertyListFormat = .binary,
                          userInfo: [CodingUserInfoKey: Any] = [:])

        public static var json: Self {
            .json()
        }

        public static var propertyList: Self {
            .propertyList()
        }
    }

    private lazy var jsonCoder = JSONCoder()
    private lazy var propertyListCoder = PropertyListCoder()
    private lazy var keyedArchiver = KeyedArchiver()

    public init() {}
}

extension Coder {
    public func encode<T: Encodable>(_ object: T, type: EncodableType) -> Result<Data, Error> {
        switch type {
        case let .json(outputFormatting, dateEncodingStrategy, dataEncodingStrategy, nonConformingFloatEncodingStrategy, keyEncodingStrategy, userInfo):
            return jsonCoder.encode(object,
                                    outputFormatting: outputFormatting,
                                    dateEncodingStrategy: dateEncodingStrategy,
                                    dataEncodingStrategy: dataEncodingStrategy,
                                    nonConformingFloatEncodingStrategy: nonConformingFloatEncodingStrategy,
                                    keyEncodingStrategy: keyEncodingStrategy,
                                    userInfo: userInfo)
        case let .propertyList(format, userInfo):
            return propertyListCoder.encode(object,
                                            format: format,
                                            userInfo: userInfo)
        }
    }

    public func encode<T: Encodable>(_ object: T, type: EncodableType) -> Data? {
        encode(object, type: type).value
    }

    public func encode<T: NSObject & NSCoding>(_ object: T, type: EncodingType) -> Result<Data, Error> {
        .success(encode(object, type: type))
    }

    public func encode<T: NSObject & NSCoding>(_ object: T, type: EncodingType) -> Data? {
        encode(object, type: type).value
    }

    public func encode<T: NSObject & NSCoding>(_ object: T, type: EncodingType) -> Data {
        switch type {
        case let .archive(outputFormat, key):
            return keyedArchiver.archive(object, outputFormat: outputFormat, forKey: key)
        }
    }

    public func encode<T: NSObject & NSCoding>(_ object: [T], type: EncodingType) -> Result<Data, Error> {
        .success(encode(object, type: type))
    }

    public func encode<T: NSObject & NSCoding>(_ object: [T], type: EncodingType) -> Data? {
        encode(object, type: type).value
    }

    public func encode<T: NSObject & NSCoding>(_ object: [T], type: EncodingType) -> Data {
        switch type {
        case let .archive(outputFormat, key):
            return keyedArchiver.archive(object, outputFormat: outputFormat, forKey: key)
        }
    }

    public func encode<T: NSObject & NSSecureCoding>(_ object: T, type: SecureEncodingType) -> Result<Data, Error> {
        .success(encode(object, type: type))
    }

    public func encode<T: NSObject & NSSecureCoding>(_ object: T, type: SecureEncodingType) -> Data? {
        encode(object, type: type).value
    }

    public func encode<T: NSObject & NSSecureCoding>(_ object: T, type: SecureEncodingType) -> Data {
        switch type {
        case let .secureArchive(requiringSecureCoding, outputFormat, key):
            return keyedArchiver.archive(object, requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat, forKey: key)
        }
    }

    public func encode<T: NSObject & NSSecureCoding>(_ object: [T], type: SecureEncodingType) -> Result<Data, Error> {
        .success(encode(object, type: type))
    }

    public func encode<T: NSObject & NSSecureCoding>(_ object: [T], type: SecureEncodingType) -> Data? {
        encode(object, type: type).value
    }

    public func encode<T: NSObject & NSSecureCoding>(_ object: [T], type: SecureEncodingType) -> Data {
        switch type {
        case let .secureArchive(requiringSecureCoding, outputFormat, key):
            return keyedArchiver.archive(object, requiringSecureCoding: requiringSecureCoding, outputFormat: outputFormat, forKey: key)
        }
    }
}

extension Coder {
    public func decode<T: Decodable>(_ data: Data?, type: DecodableType) -> Result<T, Error> {
        switch type {
        case let .json(dateDecodingStrategy, dataDecodingStrategy, nonConformingFloatDecodingStrategy, keyDecodingStrategy, userInfo, allowsJSON5, assumesTopLevelDictionary):
            return jsonCoder.decode(data,
                                    dateDecodingStrategy: dateDecodingStrategy,
                                    dataDecodingStrategy: dataDecodingStrategy,
                                    nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy,
                                    keyDecodingStrategy: keyDecodingStrategy,
                                    userInfo: userInfo,
                                    allowsJSON5: allowsJSON5,
                                    assumesTopLevelDictionary: assumesTopLevelDictionary)
        case let .propertyList(format, userInfo):
            return propertyListCoder.decode(data,
                                            format: format,
                                            userInfo: userInfo)
        }
    }

    public func decode<T: Decodable>(_ data: Data?, type: DecodableType) -> T? {
        decode(data, type: type).value
    }

    public func decode<T: NSObject & NSCoding>(_ data: Data?, type: DecodingType) -> Result<T, Error> {
        switch type {
        case let .archive(key):
            return keyedArchiver.unarchive(data, forKey: key)
        }
    }

    public func decode<T: NSObject & NSCoding>(_ data: Data?, type: DecodingType) -> T? {
        decode(data, type: type).value
    }

    public func decode<T: NSObject & NSCoding>(_ data: Data?, type: DecodingType) -> Result<[T], Error> {
        switch type {
        case let .archive(key):
            return keyedArchiver.unarchive(data, forKey: key)
        }
    }

    public func decode<T: NSObject & NSCoding>(_ data: Data?, type: DecodingType) -> [T]? {
        decode(data, type: type).value
    }

    public func decode<T: NSObject & NSSecureCoding>(_ data: Data?, type: SecureDecodingType) -> Result<T, Error> {
        switch type {
        case let .secureArchive(requiringSecureCoding, key):
            return keyedArchiver.unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key)
        }
    }

    public func decode<T: NSObject & NSSecureCoding>(_ data: Data?, type: SecureDecodingType) -> T? {
        decode(data, type: type).value
    }

    public func decode<T: NSObject & NSSecureCoding>(_ data: Data?, type: SecureDecodingType) -> Result<[T], Error> {
        switch type {
        case let .secureArchive(requiringSecureCoding, key):
            return keyedArchiver.unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key)
        }
    }

    public func decode<T: NSObject & NSSecureCoding>(_ data: Data?, type: SecureDecodingType) -> [T]? {
        decode(data, type: type).value
    }
}
