//
//  SecureCodingPage.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

final class SecureCodingPage: NSObject {
    let text: NSString

    init(text: String) {
        self.text = text as NSString
    }
}

extension SecureCodingPage: NSSecureCoding {
    static var supportsSecureCoding: Bool {
        true
    }

    func encode(with coder: NSCoder) {
        coder.encode(text, forKey: CodingKeys.text)
    }

    convenience init?(coder: NSCoder) {
        guard let text = coder.decode(of: NSString.self, forKey: CodingKeys.text) else { return nil }
        self.init(text: text as String)
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Self else {
            return false
        }
        return text == object.text
    }
}

extension SecureCodingPage {
    enum CodingKeys: String, CodingKey {
        case text
    }
}
