//
//  CodingBook.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

final class CodingBook: NSObject {
    let title: String
    let author: String
    let pages: [CodingPage]

    var pageCount: Int {
        pages.count
    }

    init(title: String, author: String, pages: [CodingPage]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}

extension CodingBook: NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode {
            $0.encode(title, forKey: CodingKeys.title)
            $0.encode(author, forKey: CodingKeys.author)
            $0.encode(pages, forKey: CodingKeys.pages)
        }
    }

    convenience init?(coder: NSCoder) {
        guard let title: String = coder.decode(forKey: CodingKeys.title),
              let author: String = coder.decode(forKey: CodingKeys.author),
              let pages: [CodingPage] = coder.decode(forKey: CodingKeys.pages) else { return nil }
        self.init(title: title, author: author, pages: pages)
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Self else {
            return false
        }
        return title == object.title && author == object.author && pages == object.pages
    }
}

extension CodingBook {
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case pages
    }
}
