//
//  QuestionEndViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 30.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation

protocol QuestionEndDelegate {
    func didQuestionEnd()
}

class QuestionEndViewModel {
 
    var delegate : QuestionEndDelegate?
    
    var item = [Milieu]()
    
    
    func loadMilieu(){
        MilieuApi.shared.getResultMilieu(milieuUrl: "socialeco") { (milieu) in
            
            self.item.removeAll()
            self.item.append(milieu)
            self.delegate?.didQuestionEnd()
            
        }
    }
    
    
    
}
