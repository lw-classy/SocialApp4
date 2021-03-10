//
//  User.swift
//  SocialApp4
//
//  Created by LevinJungstier on 07.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation

class  User {
    var username: String?
    var email: String?
    var profileImgUrl: String?
    var uid: String?
    var socialCapital : Int?
    var culturalCapital: Int?
    var economicalCapital : Int?
    var milieu : String?
    
    init(dictionary: [String:Any]) {
        username = dictionary["username"] as? String
        email = dictionary["email"] as? String
        milieu = dictionary["milieu"] as? String 
        profileImgUrl = dictionary["profileImgUrl"] as? String
        socialCapital = dictionary["socialCapital"] as? Int
        culturalCapital = dictionary["culturalCapital"] as? Int
        economicalCapital = dictionary["economicCapital"] as? Int
    }
}
