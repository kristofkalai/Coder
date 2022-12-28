//
//  Result+Extensions.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 27..
//

import Foundation

extension Result {
    var value: Success? {
        try? get()
    }
}
