//
//  String+Extension.swift
//  SampleCodable
//
//  Created by Eddie on 12/4/18.
//  Copyright © 2018 NTQ. All rights reserved.
//

import Foundation

extension String: CodingKey {

    public var stringValue: String { return self }
    public var intValue: Int? { return Int(self) }

    public init?(stringValue: String) {
        self = stringValue
    }

    public init?(intValue: Int) {
        self = String(intValue)
    }
}

// MARK: - CodingKeys
protocol CamelCaseCodingKey: CodingKey {}
extension CamelCaseCodingKey where Self: RawRepresentable, Self.RawValue == String {
    var stringValue: String {
        return rawValue.replacingOccurrences(of: "([A-Z])",
                                             with: "_$1",
                                             options: .regularExpression,
                                             range: rawValue.startIndex..<rawValue.endIndex).lowercased()
    }
}
