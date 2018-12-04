//
//  SampleModels.swift
//  SampleCodable
//
//  Created by NTQ on 12/3/18.
//  Copyright © 2018 NTQ. All rights reserved.
//

import Foundation

//struct User {
//    var username: String?
//    var age: Int?
//    var weight: Double?
//    var array: [Any]?
//    var dictionary: [String : Any] = [:]
////    var bestFriend: User?                       // Nested User object
////    private var _bestFriend: Decodable?
////    var friends: [User]?                        // Array of Users
////    var birthday: Date?
//}

public struct CommonResponse<T: Codable>: Codable {
    public var message: String
    public var body: T?
    public init(message: String, body: T?) {
        self.message = message
        self.body = body
    }
}
