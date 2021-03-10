//
//  NameCell.swift
//  SocialApp4
//
//  Created by LevinJungstier on 07.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
  
    
    var item: ProfileViewmodelItem? {
           didSet{
               guard let item = item as? ProfileViewModelName else {return}
               nameLabel.text = item.username
               }
       }
    
    let nameLabel : UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        nameLabel.font = .boldSystemFont(ofSize: 40)
        nameLabel.layer.zPosition = 2
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    let welcomeLabel : UILabel = {
       let welcomeLabel = UILabel()
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 62)
        welcomeLabel.textColor = .black
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.layer.zPosition = 1
        welcomeLabel.text = "Welcome"
        return welcomeLabel
    }()
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style:style, reuseIdentifier: reuseIdentifier)
        self.addSubview(welcomeLabel)
        self.addSubview(nameLabel)
        self.backgroundColor = .backgroundColorBlack
           
        setupViews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func updateCell(item: ProfileViewModelName){
           
           self.nameLabel.text = item.username
       }
    
   func setupViews(){
        
    
    welcomeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
    nameLabel.leftAnchor.constraint(equalTo: welcomeLabel.leftAnchor, constant: 24).isActive = true
    nameLabel.bottomAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant:9).isActive = true
    
        
    }
       

}
