//
//  QuestionEndView.swift
//  SocialApp4
//
//  Created by LevinJungstier on 30.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class QuestionEndView: UIView {
    
    let logo : UIImageView = {
        let logo = UIImageView()
        let image = UIImage(named: "")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = #imageLiteral(resourceName: "Logo")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    let milieuImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        imageView.image = UIImage(named: "prekar")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let kontoStackView : UIStackView = {
           let kontoStackView = UIStackView()
           kontoStackView.translatesAutoresizingMaskIntoConstraints = false
           kontoStackView.axis = .horizontal
          
           kontoStackView.distribution = .fillEqually
           kontoStackView.alignment = .fill
           kontoStackView.spacing = 15
          
           return kontoStackView
           
       }()
    let socialLabel = SocialKontoView()
    let economicLabel = EconomicKontoView()
    let cultureLabel = CultureKontoView()
    
    let actionButton = Button()
    let title : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Glückwunsch"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .backgroundColorBlack
        
        self.addSubview(logo)
        self.addSubview(milieuImage)
        self.addSubview(kontoStackView)
        self.addSubview(actionButton)
        self.addSubview(title)
        
        kontoStackView.addArrangedSubview(socialLabel)
        kontoStackView.addArrangedSubview(economicLabel)
        kontoStackView.addArrangedSubview(cultureLabel)
        
        self.presentSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentSubviews(){
        logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 42).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 31).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 31).isActive = true
        
        
        milieuImage.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40).isActive = true
        milieuImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        milieuImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        milieuImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4).isActive = true
        
        actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        actionButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
        actionButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        actionButton.setTitle("Kapital einnehmen", for: .normal)
        
        kontoStackView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -40).isActive = true
        kontoStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
        kontoStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
        kontoStackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        cultureLabel.valueLabel.text = "10"
        economicLabel.valueLabel.text = "10"
        socialLabel.valueLabel.text = "30"
        
        title.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 12).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    

}
