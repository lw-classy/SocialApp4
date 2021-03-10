//
//  ProfileHeader.swift
//  SocialApp4
//
//  Created by LevinJungstier on 26.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class ProfileHeader: UIView  {
  
    
    
    
    

    let kontoView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .elementBlack
        
        return view
    }()
    
    let kontoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    let socialLabel = SocialKontoView()
    let economicLabel = EconomicKontoView()
    let cultureLabel = CultureKontoView()
    
    let milieuView : UIImageView = {
        
        let milieuView = UIImageView()
        let image = UIImage(named: "")
        milieuView.backgroundColor = .backgroundColorBlack
        milieuView.image = image
        milieuView.translatesAutoresizingMaskIntoConstraints = false
        
        return milieuView
        
    }()
    
     let profileImage : UIImageView = {
           let image = UIImage(named: "")
           let profileImage = UIImageView()
           profileImage.image = image
           profileImage.backgroundColor = .borderColorGrey
           profileImage.translatesAutoresizingMaskIntoConstraints = false
           return profileImage
    }()
    
    let userName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let milieuName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
               
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.translatesAutoresizingMaskIntoConstraints = false
       
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        placeSubviews()
      
        
    }
    
    func placeSubviews() {
        self.addSubview(kontoView)
        self.addSubview(milieuView)
        milieuView.addSubview(profileImage)
        milieuView.addSubview(userName)
        milieuView.addSubview(milieuName)
        
        
        kontoView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        kontoView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        kontoView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        kontoView.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        kontoView.addSubview(kontoStackView)
        
        kontoStackView.heightAnchor.constraint(equalTo: kontoView.heightAnchor, multiplier: 2/3).isActive = true
        kontoStackView.centerXAnchor.constraint(equalTo: kontoView.centerXAnchor).isActive = true
        kontoStackView.widthAnchor.constraint(equalTo: kontoView.widthAnchor, multiplier: 3/4).isActive = true
        kontoStackView.centerYAnchor.constraint(equalTo: kontoView.centerYAnchor).isActive = true
        
        milieuView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        milieuView.bottomAnchor.constraint(equalTo: kontoView.topAnchor).isActive = true
        milieuView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        milieuView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
        kontoStackView.addArrangedSubview(socialLabel)
        kontoStackView.addArrangedSubview(cultureLabel)
        kontoStackView.addArrangedSubview(economicLabel)
        
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: userName.topAnchor, constant:-23).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 108).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 108).isActive = true
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        
        userName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        userName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 23).isActive = true
        
        
        
        milieuName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        milieuName.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5).isActive = true
        milieuName.bottomAnchor.constraint(equalTo: milieuView.bottomAnchor, constant: -10).isActive = true
        
        
    }
    
    
 
    
}
