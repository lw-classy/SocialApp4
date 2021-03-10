//
//  Milieu.swift
//  SocialApp4
//
//  Created by LevinJungstier on 09.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import Firebase

class Milieu {
    
    var milieuname: String?
    var milieudescription: String?
    var milieuImage: String?
    var lebenswelt1: String?
    var lebenswelt2: String?
    var lebenswelt3: String?
    var lebenswelt4: String?
    var lebenswelt5: String?
    
    var socialCredit : Int?
    var ecoCredit : Int?
    var cultureCredit: Int?
    
    
    init(dictionary: [String:Any]) {
        milieuname = dictionary["milieuname"] as? String
        milieudescription =  dictionary["milieudescription"] as? String
        milieuImage =  dictionary["milieuImage"] as? String
        lebenswelt1 = dictionary["lebenswelt1"] as? String
        lebenswelt2 = dictionary["lebenswelt2"] as? String
        lebenswelt3 = dictionary["lebenswelt3"] as? String
        lebenswelt4 = dictionary["lebenswelt4"] as? String
        lebenswelt5 = dictionary["lebenswelt5"] as? String
        
        socialCredit = dictionary["socialCredit"] as? Int
        ecoCredit = dictionary["ecoCredit"] as? Int
        cultureCredit = dictionary["cultureCredit"] as? Int
    }
    
}

class MilieuCount {
    var traditionalCount: Int?
    var hedosCount : Int?
    var prekarCount : Int?
    var modestCount : Int?
    var socialCount: Int?
    var adaptiveCount : Int?
    var expeditivCount: Int?
    var performCount: Int?
    var liberalCount: Int?
    var conservativeCount: Int?
    
    init(dictionary: [String:Any]){
        traditionalCount = dictionary["traditionalCount"] as? Int
        hedosCount = dictionary["hedosCount"] as? Int
        prekarCount = dictionary["prekarCount"] as? Int
        modestCount = dictionary["modestCount"] as? Int
        socialCount = dictionary["socialCount"] as? Int
        adaptiveCount = dictionary["adaptiveCount"] as? Int
        expeditivCount = dictionary["expeditivCount"] as? Int
        performCount = dictionary["performCount"] as? Int
        liberalCount = dictionary["liberalCount"] as? Int
        conservativeCount = dictionary["conservativeCount"] as? Int
        
        if traditionalCount == nil {
            traditionalCount = 0
        }
        if hedosCount == nil {
            hedosCount = 0
        }
        
        if prekarCount == nil {
            prekarCount = 0
        }
        if modestCount == nil {
            modestCount = 0
        }
        if socialCount == nil {
            socialCount = 0
        }
        if adaptiveCount == nil {
            adaptiveCount = 0
        }
        if expeditivCount == nil {
            expeditivCount = 0
        }
        if performCount == nil {
            performCount = 0
        }
        if liberalCount == nil {
            liberalCount = 0
        }
        if conservativeCount == nil {
            conservativeCount = 0
        }
        
        
    }
}




