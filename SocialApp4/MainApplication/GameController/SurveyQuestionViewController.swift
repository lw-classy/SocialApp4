//
//  SurveyQuestionViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 29.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class SurveyQuestionViewController: UIViewController, DidFinishLoadingQuestion, DidFinishQuestions{
    
    func didFinishQuestions() {
        
        finishQuestions = true
        
    }
    
    func didFinishLoadingQuestion(question: Question, questionIndex: Int) {
        
        guard let question = question.question else {return}
        questionView.question.text = question
        questionView.questionLabel.text = "Question \(questionIndex)"
        
        
    }
    
   
    
    

    var viewModel : SurveyQuestionViewModel!
    var finishQuestions : Bool = false
    let questionView = QuestionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(questionView)
        
        layoutViews()
        
        questionView.cancelButton.addTarget(self, action: #selector(abbort), for: .touchUpInside)
        questionView.button1.addTarget(self, action: #selector(pushNewQuestion1), for: .touchUpInside)
        questionView.button2.addTarget(self, action: #selector(pushNewQuestion2), for: .touchUpInside)
        questionView.button3.addTarget(self, action: #selector(pushNewQuestion3), for: .touchUpInside)
        questionView.button4.addTarget(self, action: #selector(pushNewQuestion4), for: .touchUpInside)
        questionView.button5.addTarget(self, action: #selector(pushNewQuestion5), for: .touchUpInside)
        
        viewModel.delegateLoading = self
        viewModel.delegateFinish = self
        viewModel.load()
        // Do any additional setup after loading the view.
    }
    
    func layoutViews(){
        
        questionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        questionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        questionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        questionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
   @objc func abbort(){
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    func pushQuestion(){
        
        if finishQuestions {
          let endFinishController = QuestionEndViewController()
            endFinishController.viewModel = QuestionEndViewModel()
            navigationController?.pushViewController(endFinishController, animated: true)
        }else {
            let newQuestionController = SurveyQuestionViewController()
                newQuestionController.viewModel = SurveyQuestionViewModel()
                          
                viewModel.questionIndex += 1
                      
            let questionIndex = viewModel.questionIndex
                      
                print(viewModel.questionIndex)
                newQuestionController.viewModel.update(questionIndex: questionIndex)
                navigationController?.pushViewController(newQuestionController, animated: true)
        }
      
    }
    
   
    @objc func pushNewQuestion1(){
           var delegate : PushedQuestion1?
           questionView.button1.isSelected = true
           delegate?.didPushed1()
           self.pushQuestion()
    
       }
    @objc func pushNewQuestion2(){
        var delegate : PushedQuestion2?
           questionView.button2.isSelected = true
        delegate?.didPushed2()
        self.pushQuestion()
       }
    @objc func pushNewQuestion3(){
        var delegate : PushedQuestion3?
           questionView.button3.isSelected = true
        delegate?.didPushed3()
        self.pushQuestion()
       }
    @objc func pushNewQuestion4(){
        var delegate : PushedQuestion4?
        questionView.button4.isSelected = true
        delegate?.didPushed4()
        self.pushQuestion()
       }
   @objc func pushNewQuestion5(){
    var delegate : PushedQuestion5?
        questionView.button5.isSelected = true
    delegate?.didPushed5()
        
        self.pushQuestion()
    }



}


protocol PushedQuestion1 {
    func didPushed1()
}

protocol PushedQuestion2 {
    func didPushed2()
}
protocol PushedQuestion3 {
    func didPushed3()
}
protocol PushedQuestion4 {
    func didPushed4()
}
protocol PushedQuestion5 {
    func didPushed5()
}
