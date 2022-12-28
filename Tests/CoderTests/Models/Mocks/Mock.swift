//
//  Mock.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

fileprivate struct CodableHelper {
    private static func page(prefix: String, bookPrefix: String) -> CodablePage {
        CodablePage(text: "\(bookPrefix) codable book \(prefix) codable page text")
    }

    private static func pages(bookPrefix: String) -> [CodablePage] {
        [page(prefix: "first", bookPrefix: bookPrefix), page(prefix: "second", bookPrefix: bookPrefix)]
    }

    private static func book(prefix: String, pages: [CodablePage], price: Double) -> CodableBook {
        CodableBook(title: "\(prefix) codable book title",
                    author: "\(prefix) codable book author", pages: pages,
                    price: price)
    }

    static func book(prefix: String, price: Double) -> CodableBook {
        book(prefix: prefix, pages: pages(bookPrefix: prefix), price: price)
    }
}

let firstCodableBook = CodableHelper.book(prefix: "first", price: 1.99)
let secondCodableBook = CodableHelper.book(prefix: "second", price: 2.99)
let codableBookWithInvalidPrice = CodableHelper.book(prefix: "second", price: .infinity)

fileprivate struct CodingHelper {
    private static func page(prefix: String, bookPrefix: String) -> CodingPage {
        CodingPage(text: "\(bookPrefix) coding book \(prefix) coding page text")
    }

    private static func pages(bookPrefix: String) -> [CodingPage] {
        [page(prefix: "first", bookPrefix: bookPrefix), page(prefix: "second", bookPrefix: bookPrefix)]
    }

    private static func book(prefix: String, pages: [CodingPage]) -> CodingBook {
        CodingBook(title: "\(prefix) coding book title", author: "\(prefix) coding book author", pages: pages)
    }

    static func book(prefix: String) -> CodingBook {
        book(prefix: prefix, pages: pages(bookPrefix: prefix))
    }
}

let firstCodingBook = CodingHelper.book(prefix: "first")
let secondCodingBook = CodingHelper.book(prefix: "second")

fileprivate struct SecureCodingHelper {
    private static func page(prefix: String, bookPrefix: String) -> SecureCodingPage {
        SecureCodingPage(text: "\(bookPrefix) securecoding book \(prefix) securecoding page text")
    }

    private static func pages(bookPrefix: String) -> [SecureCodingPage] {
        [page(prefix: "first", bookPrefix: bookPrefix), page(prefix: "second", bookPrefix: bookPrefix)]
    }

    private static func book(prefix: String, pages: [SecureCodingPage]) -> SecureCodingBook {
        SecureCodingBook(title: "\(prefix) securecoding book title", author: "\(prefix) securecoding book author", pages: pages)
    }

    static func book(prefix: String) -> SecureCodingBook {
        book(prefix: prefix, pages: pages(bookPrefix: prefix))
    }
}

let firstSecureCodingBook = SecureCodingHelper.book(prefix: "first")
let secondSecureCodingBook = SecureCodingHelper.book(prefix: "second")
