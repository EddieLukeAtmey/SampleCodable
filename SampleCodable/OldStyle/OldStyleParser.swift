//
//  OldStyleParser.swift
//  SampleCodable
//
//  Created by NTQ on 12/3/18.
//  Copyright © 2018 NTQ. All rights reserved.
//

import Foundation

struct User {
    var username: String?
    var age: Int?
    var weight: Double?
    var array: [Any]?
    var dictionary: [String : Any] = [:]
    //    var bestFriend: User?                       // Nested User object
    //    private var _bestFriend: Decodable?
    //    var friends: [User]?                        // Array of Users
    //    var birthday: Date?
}

// Object Mapper
//extension User: Mappable
//    required init?(map: Map) {
//
//    }
//
//    // Mappable
//    func mapping(map: Map) {
//        username    <- map["username"]
//        age         <- map["age"]
//        weight      <- map["weight"]
//        array       <- map["arr"]
//        dictionary  <- map["dict"]
//        bestFriend  <- map["best_friend"]
//        friends     <- map["friends"]
//        birthday    <- (map["birthday"], DateTransform())
//    }
//}

struct Temperature: Mappable {
    var celsius: Double?
    var fahrenheit: Double?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        celsius     <- map["celsius"]
        fahrenheit     <- map["fahrenheit"]
    }
}

// MARK: - Manual parse with SwiftyJSON
extension User {

    init(withParam param: [String: Any]) {
        parse(param)
    }

    mutating func parse(_ param: [String: Any]) {
        username = param["username"].stringValue
        age = age["age"].intValue
        weight = weight["weight"].in
        array = array["arr"]
        dictionary = dictionary["dict"]
//        bestFriend = bestFriend["best_friend"]
//        friends = friends["friends"]
//        birthday = birthday["birthday"], DateTransform())


    }
}

// MARK: - Save to UserDefault? Save Plist? Make param...?
/*
// It's not working with struct!
extension User: NSCoding {

    func encode(with aCoder: NSCoder) {
//        aCoder.encode(username, forKey: "username")
//        ......
    }

    init?(coder aDecoder: NSCoder) {
        username = aDecoder.decodeObject(forKey: "username") as? String
    }

    func saveUserDefault() {
        let data = NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: true)
        UserDefaults.standard.set(data, forKey: "User")
    }

    static func loadUserDefault() -> User? {
        guard let data = UserDefaults.standard.object(forKey: "User") as? Data else { return nil }

        return NSKeyedUnarchiver.unarchivedObject(ofClass: User.self, from: data) as? User
    }
}
*/
