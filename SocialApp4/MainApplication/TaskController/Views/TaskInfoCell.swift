//
//  TaskInfoCell.swift
//  SocialApp4
//
//  Created by LevinJungstier on 23.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit



class TaskInfoCell : UITableViewCell {

    
    var item: Task? {
        didSet{
            titleLabel.text = item?.task
            infoText.text = item?.subtitle
            
            guard let socialCost = item?.costSocial else {return}
            guard let ecoCost = item?.costEco else {return}
            guard let cultureCost = item?.costCulture else {return}
            
            socialLabel.valueLabel.text = "\(socialCost)"
            economicLabel.valueLabel.text = "\(ecoCost)"
            cultureLabel.valueLabel.text = "\(cultureCost)"
            
            
        }
    }
      
    let titleLabel : UILabel = {
           
           let titleLabel = UILabel()
           titleLabel.textColor = .white
           titleLabel.textAlignment = .left
           titleLabel.font = .boldSystemFont(ofSize: 18)
            titleLabel.numberOfLines = 0
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           return titleLabel
       }()
    
    let infoText : UILabel = {
        let infoText = UILabel()
        infoText.translatesAutoresizingMaskIntoConstraints = false
        infoText.textColor = .white
        infoText.numberOfLines = 0
        infoText.textAlignment = .left
        infoText.font = .systemFont(ofSize: 12)
        
        
        return infoText
    }()
    
    let costLabel : UILabel =  {
        let costLabel = UILabel()
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.textColor = .white
        costLabel.textAlignment = .center
        costLabel.font = .boldSystemFont(ofSize: 21)
        
        
       return costLabel
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
    
    let seperator : UIView = {
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .elementBlack
        
        return seperator
    }()
    
    let actionButton = Button()
    
    let declareLabel : UILabel = {
        let declareLabel = UILabel()
        declareLabel.textAlignment = .center
        declareLabel.font = .systemFont(ofSize: 9)
        declareLabel.numberOfLines = 0
        declareLabel.textColor = .white
        declareLabel.translatesAutoresizingMaskIntoConstraints = false
        return declareLabel
    }()
       
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
     
        self.addSubview(titleLabel)
        self.addSubview(infoText)
        self.addSubview(costLabel)
        self.addSubview(kontoStackView)
        self.addSubview(seperator)
        self.addSubview(actionButton)
        self.addSubview(declareLabel)
        self.backgroundColor = .backgroundColorBlack
            
        kontoStackView.addArrangedSubview(socialLabel)
        kontoStackView.addArrangedSubview(cultureLabel)
        kontoStackView.addArrangedSubview(economicLabel)
            
             
              
  
          }
          
          required init?(coder: NSCoder) {
              fatalError("init(coder:) has not been implemented")
          }
          
          
       
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let paddingTop: CGFloat = 12
                       
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTop).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
       
                           
        infoText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        infoText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        infoText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        
        
        costLabel.topAnchor.constraint(equalTo: infoText.bottomAnchor, constant: paddingTop*2).isActive = true
        costLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        costLabel.text = "Kosten"
        
        kontoStackView.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: paddingTop).isActive = true
        kontoStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        kontoStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2/3).isActive = true
        kontoStackView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        
        seperator.topAnchor.constraint(equalTo: kontoStackView.bottomAnchor, constant: paddingTop*2).isActive = true
        seperator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        seperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        seperator.widthAnchor.constraint(greaterThanOrEqualTo: self.widthAnchor, multiplier: 3/4).isActive = true
        
        actionButton.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: paddingTop*3).isActive = true
        actionButton.widthAnchor.constraint(greaterThanOrEqualTo: self.widthAnchor, multiplier: 6/8).isActive = true
        actionButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        actionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        actionButton.setTitle("Was hat das für Auswirkungen?", for: .normal)
        
        declareLabel.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: paddingTop).isActive = true
        declareLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -paddingTop).isActive = true
        declareLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3/4).isActive = true
        declareLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        declareLabel.text = "Du musst bezahlen um die Auswirkungen zu sehen die deine Entscheidungen und deine Einstellungen bringen"
        
                          
    }
    
   
    

}



