//
//  Task.swift
//  SocialApp4
//
//  Created by LevinJungstier on 15.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation

class Task {
    
    var task : String?
    var subtitle : String?
    var costSocial : Int?
    var costCulture : Int?
    var costEco : Int?
    
    init(dictionary:[String:Any]){
        task = dictionary["task"] as? String
        subtitle = dictionary["subtitle"] as? String
        costSocial = dictionary["costSocial"] as? Int
        costCulture = dictionary["costCulture"] as? Int
        costEco = dictionary["costEco"] as? Int
    }
}
