//
//  CodableBook.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

import Foundation

struct CodableBook {
    let title: String
    let author: String
    let pages: [CodablePage]
    let price: Double

    var pageCount: Int {
        pages.count
    }
}

extension CodableBook: Codable {}

extension CodableBook: Equatable {}
