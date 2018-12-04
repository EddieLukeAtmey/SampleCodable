//
//  NewStyleParser.swift
//  SampleCodable
//
//  Created by NTQ on 12/3/18.
//  Copyright © 2018 NTQ. All rights reserved.
//

import Foundation

public struct User {
    enum Gender: Int, Codable {
        case male, female
    }

    var username: String
    var nickName: String?
    var age: Int
    var gender: Gender?
    var weight: Double?
    var money: Decimal?
    var dob: Date?

//    var array: [Decodable]?
//    var dictionary: [String : Any] = [:]
    //    var bestFriend: User?                       // Nested User object
    //    private var _bestFriend: Decodable?
    //    var friends: [User]?                        // Array of Users
    //    var birthday: Date?
    public init(username: String, age: Int) {
        self.username = username
        self.age = age
    }
}

extension User: Codable { // That's it. all good.

    // part 2:
//    public func encode(to encoder: Encoder) throws {
//        encoder.container(keyedBy: <#T##CodingKey.Protocol#>)
//    }
} 
