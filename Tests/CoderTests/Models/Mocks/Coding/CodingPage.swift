//
//  CodingPage.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

final class CodingPage: NSObject {
    let text: String

    init(text: String) {
        self.text = text
    }
}

extension CodingPage: NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(text, forKey: CodingKeys.text)
    }

    convenience init?(coder: NSCoder) {
        guard let text: String = coder.decode(forKey: CodingKeys.text) else { return nil }
        self.init(text: text)
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Self else {
            return false
        }
        return text == object.text
    }
}

extension CodingPage {
    enum CodingKeys: String, CodingKey {
        case text
    }
}
