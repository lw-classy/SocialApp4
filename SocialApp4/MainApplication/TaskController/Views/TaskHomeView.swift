//
//  TaskHomeView.swift
//  SocialApp4
//
//  Created by LevinJungstier on 15.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class TaskHomeView: UIView {
    
    
    var item : User? {
        didSet{
            let milieuImage = "prekar"
            
            nameLabel.text = item?.username
            guard let cultureCapital = item?.culturalCapital else {return}
            guard let economicCapital = item?.economicalCapital else {return}
            guard let socialCapital = item?.socialCapital else {return}
            guard let profileImg = item?.profileImgUrl else {return}
            guard let url = URL(string:profileImg) else {return}
            guard let milieu = item?.milieu else {return}
            cultureLabel.valueLabel.text = "\(cultureCapital)"
            economicLabel.valueLabel.text = "\(economicCapital)"
            socialLabel.valueLabel.text = "\(socialCapital)"
            profileImage.sd_setImage(with: url) { (_, _, _, _) in}
            milieuLabel.text = milieu
            
            
            
        }
    }
    
 
    
   let profileView : UIView = {
        let profileView = UIView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .elementBlack
        return profileView
    }()
    
    let profileImage : UIImageView = {
        let image = UIImage(named: "")
        let profileImage = UIImageView()
        profileImage.image = image
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    let nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .white
        
        return nameLabel
    }()
    
    let milieuLabel : UILabel = {
        let milieuLabel = UILabel()
        milieuLabel.translatesAutoresizingMaskIntoConstraints = false
        milieuLabel.font = .systemFont(ofSize: 12)
        milieuLabel.textColor = .white
        return milieuLabel
    }()
    
    let milieuImage : UIImageView = {
        let milieuImage = UIImageView()
        milieuImage.translatesAutoresizingMaskIntoConstraints = false
        milieuImage.contentMode = .scaleAspectFit
        return milieuImage
    }()
    
    let levelNumber : UILabel = {
        let levelNumber = UILabel()
        levelNumber.translatesAutoresizingMaskIntoConstraints = false
        levelNumber.font = .boldSystemFont(ofSize: 28)
        levelNumber.textColor = .white
        levelNumber.layer.zPosition = 2
        return levelNumber
    }()
    
    let wealthLabel : UILabel = {
        let wealthLabel = UILabel()
        wealthLabel.translatesAutoresizingMaskIntoConstraints = false
        wealthLabel.font = .boldSystemFont(ofSize: 21)
        wealthLabel.textColor = .white
        return wealthLabel
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(profileView)
        
        
        profileView.addSubview(profileImage)
        profileView.addSubview(nameLabel)
        profileView.addSubview(milieuLabel)
        profileView.addSubview(milieuImage)
        profileView.addSubview(levelNumber)
        profileView.addSubview(wealthLabel)
        profileView.addSubview(kontoStackView)
        
        
        kontoStackView.addArrangedSubview(socialLabel)
        kontoStackView.addArrangedSubview(economicLabel)
        kontoStackView.addArrangedSubview(cultureLabel)
        
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    
    override func layoutSubviews() {
        
        let paddingLeftRight = self.bounds.size.width/100 * CGFloat(3)
        let paddingTop = self.bounds.size.height/100 * CGFloat(12)
        let paddingBottom = self.bounds.size.height/100 * CGFloat(12)
     
        profileView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profileView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        profileView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        profileImage.topAnchor.constraint(equalTo: profileView.topAnchor, constant: paddingTop).isActive = true
        profileImage.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: paddingLeftRight).isActive = true
        profileImage.heightAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 48/320).isActive = true
        profileImage.widthAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 48/320).isActive = true
        

        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        
        
        nameLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: paddingTop).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: paddingLeftRight).isActive = true
        nameLabel.text = "Suaznne Klatten"
        
        milieuLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12).isActive = true
        milieuLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: paddingLeftRight).isActive = true
        milieuLabel.text = "Bürgerliche Mitte"
        
        milieuImage.topAnchor.constraint(equalTo: profileView.topAnchor, constant: paddingTop).isActive = true
        milieuImage.rightAnchor.constraint(equalTo: profileView.rightAnchor, constant: -paddingLeftRight).isActive = true
        milieuImage.heightAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 48/320).isActive = true
        milieuImage.widthAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 48/320).isActive = true
        
        
        levelNumber.centerYAnchor.constraint(equalTo: milieuImage.centerYAnchor).isActive = true
        levelNumber.leftAnchor.constraint(equalTo: milieuImage.leftAnchor, constant: -paddingLeftRight).isActive = true
        levelNumber.text = "28"
        
        
        wealthLabel.centerYAnchor.constraint(equalTo: kontoStackView.centerYAnchor).isActive = true
        wealthLabel.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: paddingLeftRight).isActive = true
        wealthLabel.text = "Vermögen"
        
        kontoStackView.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -paddingTop).isActive = true
        kontoStackView.rightAnchor.constraint(equalTo: profileView.rightAnchor, constant: -paddingLeftRight).isActive = true
        kontoStackView.heightAnchor.constraint(equalTo: profileView.heightAnchor, multiplier: 37/143).isActive = true
        kontoStackView.widthAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 1/2).isActive = true
        
    }
    
    func switchMilieuImage(milieu: String) {
        switch(item?.milieu){
        case "Prekäre" :
            milieuImage.image = UIImage(named: "prekar")
        
        default:
            return
        }
    }
    
}



