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

    private enum CodingKeys: String, CodingKey {
        case username = "user_name"
        case nickName , age , gender , weight , money , dob
    }

    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
        var container = try decoder.unkeyedContainer()
        username = try container.decode(String.self)
        age = try (Int(container.decode(String.self)) ?? 0)
//
//        username = try container.decode(String.self, forKey: "user_name")
//        let ageD = try container.decode(Double.self, forKey: "age")
//        age = Int(ageD)
//        nickName = try container.decodeIfPresent(String.self, forKey: "nickName")
    }


    // part 2:
//    public func encode(to encoder: Encoder) throws {
//        encoder.container(keyedBy: <#T##CodingKey.Protocol#>)
//    }

    func saveUserDefault() {
        guard let data = try? PropertyListEncoder().encode(self) else { return }
        UserDefaults.standard.set(data, forKey: "X")
    }

    static func loadUserDefault() -> User? {
        guard let data = UserDefaults.standard.object(forKey: "X") as? Data else { return nil }
        let user = try? PropertyListDecoder().decode(User.self, from: data)
        return user
    }
}

//extension NSObject: Codable {
//    public required init(from decoder: Decoder) throws {
//
//    }
//    public func encode(to encoder: Encoder) throws {
//
//    }
//}
