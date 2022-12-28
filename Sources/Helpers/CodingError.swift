//
//  CodingError.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 28..
//

enum CodingError {
    enum UnarchiverError: Error {
        case invalidInput
        case invalidData
    }

    enum DecodingError: Error {
        case invalidInput
    }
}
