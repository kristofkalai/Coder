//
//  SecureCodingBook.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

final class SecureCodingBook: NSObject {
    let title: NSString
    let author: NSString
    let pages: [SecureCodingPage]

    var pageCount: Int {
        pages.count
    }

    init(title: String, author: String, pages: [SecureCodingPage]) {
        self.title = title as NSString
        self.author = author as NSString
        self.pages = pages
    }
}

extension SecureCodingBook: NSSecureCoding {
    static var supportsSecureCoding: Bool {
        true
    }

    func encode(with coder: NSCoder) {
        coder.encode {
            $0.encode(title, forKey: CodingKeys.title)
            $0.encode(author, forKey: CodingKeys.author)
            $0.encode(pages, forKey: CodingKeys.pages)
        }
    }

    convenience init?(coder: NSCoder) {
        guard let title = coder.decode(of: NSString.self, forKey: CodingKeys.title),
              let author = coder.decode(of: NSString.self, forKey: CodingKeys.author) else { return nil }
        guard let pages: [SecureCodingPage] = {
            if #available(iOS 14.0, *) {
                return coder.decodeArray(forKey: CodingKeys.pages)
            } else {
                return coder.decode(forKey: CodingKeys.pages)
            }
        }() else { return nil }
        self.init(title: title as String, author: author as String, pages: pages)
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Self else {
            return false
        }
        return title == object.title && author == object.author && pages == object.pages
    }
}

extension SecureCodingBook {
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case pages
    }
}
