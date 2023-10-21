//
//  TopLevel+Extensions.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 27..
//

@_implementationOnly import ExceptionCatcher

@discardableResult func catchException<T>(callback: () throws -> T) throws -> T {
    try ExceptionCatcher.rethrow(callback: callback)
}
