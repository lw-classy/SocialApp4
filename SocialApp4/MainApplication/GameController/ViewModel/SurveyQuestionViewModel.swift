//
//  QuestionnaireViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 12.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import ResearchKit


protocol DidFinishLoadingQuestion {
    func didFinishLoadingQuestion(question: Question, questionIndex: Int)
}

protocol DidFinishQuestions {
    func didFinishQuestions()
}

class SurveyQuestionViewModel : NSObject {
    

    
    
    
    var delegateLoading: DidFinishLoadingQuestion?
    var delegateFinish: DidFinishQuestions?
    var item = [Question]()
    var milieuCount = [MilieuCount]()
    
    var traditionalChoice: Int?
    var hedosChoice : Int?
    var prekarChoice : Int?
    var modestChoice : Int?
    var socialChoice: Int?
    var adaptiveChoice : Int?
    var expeditivChoice: Int?
    var performChoice: Int?
    var liberalChoice: Int?
    var conservativeChoice: Int?
    
    
    var questionUrl: String = ""
    var questionIndex: Int = 0
    
    func update(questionIndex: Int?){
        guard let question = questionIndex else {return}
        self.questionIndex = question
        
        if question < 10 {
            self.questionUrl = "question0\(question)"
        }else {
            self.questionUrl = "question\(question)"
        }
        
        
    }
    
    func load(){
        if questionIndex < 31 {
            QuestionApi.shared.getQuestion(questionUrl: self.questionUrl) { (question) in
                self.item.removeAll()
                self.item.append(question)
                
                self.delegateLoading?.didFinishLoadingQuestion(question: question, questionIndex: self.questionIndex)
                
            }
        } else {
            self.delegateFinish?.didFinishQuestions()
            QuestionApi.shared.getQuestion(questionUrl: self.questionUrl) { (question) in
            self.item.removeAll()
            self.item.append(question)
            self.delegateLoading?.didFinishLoadingQuestion(question: question, questionIndex: self.questionIndex)
        }
        
        }
    }
    
    func findMilieu(){
        switch(questionIndex){
        case 0:
            return
        case 1:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 1
            modestChoice = 2
            socialChoice = 4
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 4
          return 
            
        case 2:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 0
            modestChoice = 2
            socialChoice = 4
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 3
            liberalChoice = 4
            conservativeChoice = 3
            return
        
        case 3:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 1
            modestChoice = 1
            socialChoice = 4
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 0
            return
        case 4:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 4
            modestChoice = 1
            socialChoice = 1
            adaptiveChoice = 3
            expeditivChoice = 3
            performChoice = 4
            liberalChoice = 1
            conservativeChoice = 1
            return
        case 5:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 1
            modestChoice = 0
            socialChoice = 0
            adaptiveChoice = 2
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 1
            conservativeChoice = 0
            return
        case 6:
            traditionalChoice = 4
            hedosChoice = 3
            prekarChoice = 0
            modestChoice = 2
            socialChoice = 4
            adaptiveChoice = 0
            expeditivChoice = 3
            performChoice = 0
            liberalChoice = 4
            conservativeChoice = 4
            return
        case 7:
            traditionalChoice = 0
            hedosChoice = 0
            prekarChoice = 0
            modestChoice = 3
            socialChoice = 1
            adaptiveChoice = 3
            expeditivChoice = 3
            performChoice = 4
            liberalChoice = 1
            conservativeChoice = 4
            return
        case 8:
            traditionalChoice = 4
            hedosChoice = 0
            prekarChoice = 1
            modestChoice = 4
            socialChoice = 0
            adaptiveChoice = 4
            expeditivChoice = 0
            performChoice = 1
            liberalChoice = 1
            conservativeChoice = 4
            return
        case 9:
            traditionalChoice = 4
            hedosChoice = 1
            prekarChoice = 3
            modestChoice = 2
            socialChoice = 0
            adaptiveChoice = 4
            expeditivChoice = 0
            performChoice = 3
            liberalChoice = 0
            conservativeChoice = 4
            return
        case 10:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 4
            modestChoice = 0
            socialChoice = 1
            adaptiveChoice = 4
            expeditivChoice = 0
            performChoice = 3
            liberalChoice = 1
            conservativeChoice = 4
            return
        case 11:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 0
            modestChoice = 0
            socialChoice = 0
            adaptiveChoice = 0
            expeditivChoice = 3
            performChoice = 3
            liberalChoice = 1
            conservativeChoice = 0
            return 
        case 12:
            traditionalChoice = 0
            hedosChoice = 2
            prekarChoice = 0
            modestChoice = 0
            socialChoice = 4
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 4
            return
        case 13:
            traditionalChoice = 4
            hedosChoice = 2
            prekarChoice = 1
            modestChoice = 1
            socialChoice = 4
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 4
            return
        case 14:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 4
            modestChoice = 4
            socialChoice = 3
            adaptiveChoice = 0
            expeditivChoice = 3
            performChoice = 0
            liberalChoice = 3
            conservativeChoice = 0
            return
        case 15:
            traditionalChoice = 4
            hedosChoice = 0
            prekarChoice = 0
            modestChoice = 4
            socialChoice = 4
            adaptiveChoice = 1
            expeditivChoice = 4
            performChoice = 3
            liberalChoice = 4
            conservativeChoice = 4
            return
        case 16:
            traditionalChoice = 0
            hedosChoice = 0
            prekarChoice = 0
            modestChoice = 1
            socialChoice = 4
            adaptiveChoice = 0
            expeditivChoice = 4
            performChoice = 3
            liberalChoice = 4
            conservativeChoice = 4
            return
        case 17:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 4
            modestChoice = 1
            socialChoice = 4
            adaptiveChoice = 1
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 1
            return
        case 18:
            traditionalChoice = 4
            hedosChoice = 3
            prekarChoice = 4
            modestChoice = 1
            socialChoice = 4
            adaptiveChoice = 0
            expeditivChoice = 3
            performChoice = 0
            liberalChoice = 0
            conservativeChoice = 0
            return
        case 19:
            traditionalChoice = 4
            hedosChoice = 4
            prekarChoice = 0
            modestChoice = 0
            socialChoice = 3
            adaptiveChoice = 1
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 2
            conservativeChoice = 4
            return
        case 20:
            traditionalChoice = 4
            hedosChoice = 0
            prekarChoice = 4
            modestChoice = 3
            socialChoice = 0
            adaptiveChoice = 1
            expeditivChoice = 0
            performChoice = 0
            liberalChoice = 0
            conservativeChoice = 1
            return
        case 21:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 2
            modestChoice = 1
            socialChoice = 4
            adaptiveChoice = 3
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 2
            return
        case 22:
            traditionalChoice = 4
            hedosChoice = 0
            prekarChoice = 1
            modestChoice = 4
            socialChoice = 3
            adaptiveChoice = 4
            expeditivChoice = 1
            performChoice = 4
            liberalChoice = 1
            conservativeChoice = 4
            return
        case 23:
            traditionalChoice = 4
            hedosChoice = 0
            prekarChoice = 4
            modestChoice = 3
            socialChoice = 0
            adaptiveChoice = 1
            expeditivChoice = 0
            performChoice = 0
            liberalChoice = 0
            conservativeChoice = 4
            return
        case 24:
            traditionalChoice = 0
            hedosChoice = 0
            prekarChoice = 0
            modestChoice = 1
            socialChoice = 0
            adaptiveChoice = 4
            expeditivChoice = 1
            performChoice = 4
            liberalChoice = 1
            conservativeChoice = 1
            return
        case 25:
            traditionalChoice = 0
            hedosChoice = 3
            prekarChoice = 1
            modestChoice = 1
            socialChoice = 0
            adaptiveChoice = 4
            expeditivChoice = 2
            performChoice = 4
            liberalChoice = 1
            conservativeChoice = 0
            return
        case 26:
            traditionalChoice = 4
            hedosChoice = 4
            prekarChoice = 0
            modestChoice = 3
            socialChoice = 0
            adaptiveChoice = 1
            expeditivChoice = 3
            performChoice = 1
            liberalChoice = 1
            conservativeChoice = 4
            return
        case 27:
            traditionalChoice = 4
            hedosChoice = 0
            prekarChoice = 2
            modestChoice = 4
            socialChoice = 1
            adaptiveChoice = 3
            expeditivChoice = 1
            performChoice = 4
            liberalChoice = 1
            conservativeChoice = 4
            return
        case 28:
            traditionalChoice = 1
            hedosChoice = 4
            prekarChoice = 0
            modestChoice = 3
            socialChoice = 4
            adaptiveChoice = 3
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 3
            return
        case 29:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 0
            modestChoice = 2
            socialChoice = 4
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 1
            return
        case 30:
            traditionalChoice = 0
            hedosChoice = 4
            prekarChoice = 1
            modestChoice = 0
            socialChoice = 3
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 4
            return
        case 31:
            traditionalChoice = 4
            hedosChoice = 4
            prekarChoice = 2
            modestChoice = 4
            socialChoice = 4
            adaptiveChoice = 4
            expeditivChoice = 4
            performChoice = 4
            liberalChoice = 4
            conservativeChoice = 4
            return
            
        default:
            return
        }
        
    }
    

}







