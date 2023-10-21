//
//  NSKeyedUnarchiver+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

extension NSKeyedUnarchiver {
    public static func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> Result<T, Error> {
        do {
            let result = try NSKeyedUnarchiver
                .create(data, requiringSecureCoding: requiringSecureCoding)
                .decoded(of: T.self, forKey: key)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    public static func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> Result<T, Error> {
        do {
            let result = try NSKeyedUnarchiver
                .create(data, requiringSecureCoding: false)
                .decoded(of: T.self, forKey: key)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    public static func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> Result<[T], Error> {
        do {
            let result = try NSKeyedUnarchiver
                .create(data, requiringSecureCoding: requiringSecureCoding)
                .decodedArray(of: T.self, forKey: key)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    public static func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> Result<[T], Error> {
        do {
            let result = try NSKeyedUnarchiver
                .create(data, requiringSecureCoding: false)
                .decode(forKey: key)
            guard let result = result as? [T] else {
                throw CodingError.UnarchiverError.invalidData
            }
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}

extension NSKeyedUnarchiver {
    public static func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> T? {
        unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key).value
    }

    public static func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> T? {
        unarchive(data, forKey: key).value
    }

    public static func unarchive<T: NSObject & NSSecureCoding>(
        _ data: Data?,
        requiringSecureCoding: Bool = true,
        forKey key: ArchiverKey = .root
    ) -> [T]? {
        unarchive(data, requiringSecureCoding: requiringSecureCoding, forKey: key).value
    }

    public static func unarchive<T: NSObject & NSCoding>(
        _ data: Data?,
        forKey key: ArchiverKey = .root
    ) -> [T]? {
        unarchive(data, forKey: key).value
    }
}

extension NSKeyedUnarchiver {
    public static func create(
        _ data: Data?,
        requiringSecureCoding: Bool = false
    ) throws -> NSKeyedUnarchiver {
        guard let data else {
            throw CodingError.UnarchiverError.invalidInput
        }
        let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
        unarchiver.requiresSecureCoding = requiringSecureCoding
        return unarchiver
    }
}

extension NSKeyedUnarchiver {
    private func decoded<T: NSObject & NSCoding>(of cls: T.Type, forKey key: ArchiverKey) throws -> T {
        do {
            return try catchException {
                guard let result = decode(of: T.self, forKey: key) else {
                    throw CodingError.UnarchiverError.invalidData
                }
                return result
            }
        } catch {
            guard let result = decode(forKey: key) as? T else {
                throw error
            }
            return result
        }
    }

    private func decodedArray<T: NSObject & NSSecureCoding>(of cls: T.Type, forKey key: ArchiverKey) throws -> [T] {
        func fallback(error: Error) throws -> [T] {
            guard let result = decode(forKey: key) as? [T] else {
                throw error
            }
            return result
        }
        do {
            return try catchException {
                if #available(iOS 14.0, macOS 11.0, *) {
                    guard let result: [T] = decodeArray(forKey: key) else {
                        throw CodingError.UnarchiverError.invalidData
                    }
                    return result
                } else {
                    return try fallback(error: CodingError.UnarchiverError.invalidData)
                }
            }
        } catch {
            return try fallback(error: error)
        }
    }
}
