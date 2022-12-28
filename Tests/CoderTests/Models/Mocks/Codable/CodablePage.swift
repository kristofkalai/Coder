//
//  CodablePage.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

struct CodablePage {
    let text: String
}

extension CodablePage: Codable {}

extension CodablePage: Equatable {}
