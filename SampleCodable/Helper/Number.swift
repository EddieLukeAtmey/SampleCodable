//
//  Number.swift
//  SampleCodable
//
//  Created by Eddie on 4/8/20.
//  Copyright © 2020 Eddie. All rights reserved.
//

import Foundation
import Darwin /
struct Number: IntegerLiteralConvertible, FloatLiteralConvertible, StringLiteralConvertible, CustomStringConvertible {

    typealias ExtendedGraphemeClusterLiteralType = String
    typealias UnicodeScalarLiteralType = String

    private enum Type {
        case Int
        case Double
    }
    private var _type: Type
    private var _intValue: Int
    private var _doubleValue: Double

    var intValue: Int { return _intValue }
    var doubleValue: Double { return _doubleValue }

    init(_ str: String) {
        if let i = Int(str) {
            _intValue = i
            _doubleValue = Double(i)
            _type = .Int
        } else if let d = Double(str) {
            _doubleValue = d
            _intValue = Int(round(d))
            _type = .Double
        } else {
            _intValue = 0
            _doubleValue = 0
        }
    }
    init(_ i: Int) {
        _intValue = i
        _doubleValue = Double(i)
        _type = .Int
    }
    init(_ d: Double) {
        _doubleValue = d
        _intValue = Int(round(d))
        _type = .Double
    }
    init(integerLiteral value: Int) {
        _intValue = value
        _doubleValue = Double(value)
        _type = .Int
    }
    init(floatLiteral value: Double) {
        _doubleValue = value
        _intValue = Int(round(value))
        _type = .Double
    }
    init(stringLiteral value: String) {
        if let d = Double(value), let _ = value.characters.indexOf(".") {
            _doubleValue = d
            _intValue = Int(d)
            _type = .Double
        } else if let i = Int(value) {
            _intValue = i
            _doubleValue = Double(i)
            _type = .Int
        } else {
            _intValue = 0
            _doubleValue = 0
        }
    }

    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        if let d = Double(value) {
            _doubleValue = d
            _intValue = Int(d)
            _type = .Double
        } else if let i = Int(value) {
            _intValue = i
            _doubleValue = Double(i)
            _type = .Int
        } else {
            _intValue = 0
            _doubleValue = 0
        }
    }
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        if let d = Double(value) {
            _doubleValue = d
            _intValue = Int(d)
            _type = .Double
        } else if let i = Int(value) {
            _intValue = i
            _doubleValue = Double(i)
            _type = .Int
        } else {
            _intValue = 0
            _doubleValue = 0
        }
    }

    var stringValue: String {
        switch _type {
        case .Int:
            return "\(_intValue)"
        case .Double:
            return "\(_doubleValue)"
        }
    }

    var description: String { return stringValue }
}

extension Number: Decodable {

    init(from decoder: Decoder) throws {
        let val = try decoder.singleValueContainer()

        if let d = try? val.decode(Double.self) {
            self.init(d)
        }
        else if let i = try? val.decode(Int.self) {
            self.init(i)
        }
        else if let i = try? val.decode(String.self) {
            self.init(i)
        }

        throw DecodingError.typeMismatch(Number.self, .init(codingPath: decoder.codingPath, debugDescription: ""))
    }
}
