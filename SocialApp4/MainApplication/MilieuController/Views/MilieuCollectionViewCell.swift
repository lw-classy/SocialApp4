//
//  MilieuCollectionViewCell.swift
//  SocialApp4
//
//  Created by LevinJungstier on 09.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit
import SDWebImage

class MilieuCollectionViewCell: UICollectionViewCell {
    
    
    
    var item: Milieu? {
        didSet{
            
            guard let milieuname = item?.milieuname else {return}
            guard let milieuImageUrl = item?.milieuImage else {return}
            
            reloadData(milieuname: milieuname, milieuImageUrl: milieuImageUrl)
       
        }
    }
    
    let nameLabel : UILabel = {
          
        let nameLabel = UILabel()
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.layer.zPosition = 2
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        
          return nameLabel
      }()
    
    let milieuImage : UIImageView =  {
        
        let milieuImage = UIImageView()
        milieuImage.contentMode = .scaleAspectFit
        milieuImage.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        
        
        
        return milieuImage
    }()
      
    
    override init(frame:CGRect){
        super.init(frame: frame)
       
        self.addSubview(nameLabel)
        self.addSubview(milieuImage)
        self.backgroundColor = .elementBlack
        placeElements()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func placeElements(){
        
        
        let paddingSides = self.frame.size.width/100*CGFloat(7.2)
        let paddingTop = self.frame.size.height/100*CGFloat(7.5)
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTop).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant:paddingSides).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -paddingSides).isActive = true
        
       
        milieuImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 59.375/100).isActive = true
        milieuImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant:paddingSides).isActive = true
        milieuImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -paddingSides).isActive = true
        milieuImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-paddingTop).isActive = true
          
       }
    
    
    func reloadData(milieuname: String, milieuImageUrl: String) {
        nameLabel.text = milieuname
        milieuImage.image = UIImage(named: milieuImageUrl)
      
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width/24
        self.clipsToBounds = true
        
    }
    
}


