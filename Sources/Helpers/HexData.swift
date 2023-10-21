//
//  HexData.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

public final class HexData {
    enum Source {
        case data(Data, String? = nil)
        case string(String, Data? = nil)
    }

    private var source: Source

    public var data: Data {
        switch source {
        case let .data(data, _): return data
        case let .string(string, data):
            guard let data else {
                source = .string(string, string.hexData)
                return self.data
            }
            return data
        }
    }

    public var string: String {
        switch source {
        case let .data(data, string):
            guard let string else {
                source = .data(data, data.hexString)
                return self.string
            }
            return string
        case let .string(string, _): return string
        }
    }

    private init(source: Source) {
        self.source = source
    }
}

extension HexData {
    public convenience init(data: Data) {
        self.init(source: .data(data))
    }

    public convenience init(string: String) {
        self.init(source: .string(string))
    }
}

extension Data {
    var hexString: String {
        let hexAlphabet = Array("0123456789abcdef".unicodeScalars)
        return String(reduce(into: String().unicodeScalars) {
            $0.append(hexAlphabet[Int($1 / 0x10)])
            $0.append(hexAlphabet[Int($1 % 0x10)])
        })
    }
}

extension String {
    var hexData: Data {
        let chars = Array(utf8)

        var bytes = [UInt8]()
        bytes.reserveCapacity(count / 2)

        let map: [UInt8] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, // 01234567
            0x08, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 89:;<=>?
            0x00, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, // @ABCDEFG
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00  // HIJKLMNO
        ]

        stride(from: .zero, to: count, by: 2).forEach {
            let index1 = Int(chars[$0] & 0x1F ^ 0x10)
            let index2 = Int(chars[$0 + 1] & 0x1F ^ 0x10)
            bytes.append(map[index1] << 4 | map[index2])
        }

        return Data(bytes)
    }
}
