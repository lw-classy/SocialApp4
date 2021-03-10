//
//  QuestionView.swift
//  SocialApp4
//
//  Created by LevinJungstier on 29.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    let logo : UIImageView = {
        let logo = UIImageView()
        let image = UIImage(named: "")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = #imageLiteral(resourceName: "Logo")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    let questionLabel : UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let question : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let fullAgree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 9)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    let fullDisagree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 9)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    let buttonView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let button1 = RoundButton()
    let button2 = RoundButton()
    let button3 = RoundButton()
    let button4 = RoundButton()
    let button5 = RoundButton()
    
    let buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    let cancelButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColorBlack
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logo)
        self.addSubview(questionLabel)
        self.addSubview(question)
        self.addSubview(buttonView)
       
        buttonView.addSubview(buttonStackView)
        buttonView.addSubview(fullAgree)
        buttonView.addSubview(fullDisagree)
        buttonView.addSubview(cancelButton)
        
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        buttonStackView.addArrangedSubview(button3)
        buttonStackView.addArrangedSubview(button4)
        buttonStackView.addArrangedSubview(button5)
        
        
        layoutViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layoutViews(){
        logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 42).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 31).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 31).isActive = true
    
        
        questionLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 24).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        question.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 24).isActive = true
        question.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 52).isActive = true
        question.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -52).isActive = true
        
        
        button1.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 36).isActive = true
        button2.widthAnchor.constraint(equalToConstant: 36).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 25).isActive = true
        button3.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button4.heightAnchor.constraint(equalToConstant: 36).isActive = true
        button4.widthAnchor.constraint(equalToConstant: 36).isActive = true
        button5.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        button1.layer.borderColor = UIColor.borderButton1.cgColor
        button2.layer.borderColor = UIColor.borderButton2.cgColor
        button3.layer.borderColor = UIColor.borderButton3.cgColor
        button4.layer.borderColor = UIColor.borderButton4.cgColor
        button5.layer.borderColor = UIColor.borderButton5.cgColor
        
        
        button1.setBackgroundColor(.borderButton1, for: .selected)
        button2.setBackgroundColor(.borderButton2, for: .selected)
        button3.setBackgroundColor(.borderButton3, for: .selected)
        button4.setBackgroundColor(.borderButton4, for: .selected)
        button5.setBackgroundColor(.borderButton5, for: .selected)
        
        
        
        buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        buttonView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        buttonView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 200/460).isActive = true
        
        cancelButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -50).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.borderButton3, for: .highlighted)
        
        fullDisagree.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant:  12).isActive = true
        fullDisagree.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        fullDisagree.widthAnchor.constraint(equalToConstant: 100).isActive = true
        fullDisagree.text = "Stimme überhaupt nicht zu"
        
        fullAgree.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant:  12).isActive = true
        fullAgree.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        fullAgree.widthAnchor.constraint(equalToConstant: 100).isActive = true
        fullAgree.text = "Stimme voll zu"
        
        
        buttonStackView.topAnchor.constraint(equalTo: buttonView.topAnchor).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 36).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -36).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
        
        
    }
    
}
