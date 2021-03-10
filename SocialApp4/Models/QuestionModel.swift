//
//  QuestionModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 11.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation

class Question {
    var question : String?
    
        init(dictionary: [String:Any]) {
        question = dictionary["question"] as? String
       
    }
}


class QuestionMilieu {
       var precar : Int?
       var traditional : Int?
       var hedonist : Int?
       var modest : Int?
       var eco : Int?
       var adaptive : Int?
       var expad : Int?
       var perform : Int?
       var liberal : Int?
       var konservativ : Int?
    
    init(dictionary: [Int]){
        
    }
}


