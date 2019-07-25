//
//  StringExtensions.swift
//  Project28
//
//  Created by Tero on 7/25/19.
//  Copyright © 2019 Tero. All rights reserved.
//

import Foundation

enum SubstringError: Error {
    case invalidStart
    case invalidLength
    case overrun
}

public extension String {
    func substring(start: Int, length: Int) throws -> String {
        if start < 0 {
            throw SubstringError.invalidStart
        }
        if length < 0 {
            throw SubstringError.invalidLength
        }
        if length == 0 {
            return ""
        }
        if length + start > self.count {
            throw SubstringError.overrun
        }
        let startPosition = self.index(self.startIndex, offsetBy: start)
        let endPosition = self.index(self.startIndex, offsetBy: length + start - 1)

        return String(self[startPosition...endPosition])
    }

    subscript (bounds: CountableClosedRange<Int>) -> String {
        let startPosition = index(startIndex, offsetBy: bounds.lowerBound)
        let endPosition = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startPosition...endPosition])
    }
}


