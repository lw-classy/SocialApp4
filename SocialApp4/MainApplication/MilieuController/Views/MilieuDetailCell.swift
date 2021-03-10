//
//  MilieuDetailCell.swift
//  SocialApp4
//
//  Created by LevinJungstier on 10.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit
class MilieuDetailCell : UITableViewCell {
  
    
    var item: Milieu? {
           didSet{
            guard let milieu = item else {return}
            updateCell(item: milieu)
            }
       }
    
    let nameLabel : UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textColor = .white
        nameLabel.layer.zPosition = 2
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let milieuImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let milieuDescription : UILabel =  {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.layer.zPosition = 2
        return label
    }()
    
    let lebensweltLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Lebenswelt"
        
        return label
    }()
    
    let lebensweltImage1 : UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .elementBlack
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let lebensweltImage2 : UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .elementBlack
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let lebensweltImage3 : UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .elementBlack
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let lebensweltImage4 : UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .elementBlack
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let lebensweltImage5 : UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .elementBlack
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
 
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style:style, reuseIdentifier: reuseIdentifier)
  
        self.addSubview(nameLabel)
        self.addSubview(milieuImage)
        self.addSubview(milieuDescription)
        self.addSubview(lebensweltLabel)
        self.addSubview(lebensweltImage1)
        self.addSubview(lebensweltImage2)
        self.addSubview(lebensweltImage3)
        self.addSubview(lebensweltImage4)
        self.addSubview(lebensweltImage5)
        self.backgroundColor = .backgroundColorBlack
           
        setupViews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func updateCell(item: Milieu){
         
        self.nameLabel.text = item.milieuname
        guard let milieuImage = item.milieuImage else {return}
        guard let lebenswelt1 = item.lebenswelt1 else {return}
        guard let lebenswelt2 = item.lebenswelt2 else {return}
        guard let lebenswelt3 = item.lebenswelt3 else {return}
        guard let lebenswelt4 = item.lebenswelt4 else {return}
        guard let lebenswelt5 = item.lebenswelt5 else {return}
        
        self.milieuImage.image = UIImage(named: milieuImage)
        self.milieuDescription.text = item.milieudescription
        self.lebensweltImage1.image = UIImage(named: lebenswelt1)
        self.lebensweltImage2.image = UIImage(named: lebenswelt2)
        self.lebensweltImage3.image = UIImage(named: lebenswelt3)
        self.lebensweltImage4.image = UIImage(named: lebenswelt4)
        self.lebensweltImage5.image = UIImage(named: lebenswelt5)
        
        
       
       }
    
   func setupViews(){
        
 
    nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
    nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
    
    
    milieuImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 19).isActive = true
    milieuImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 19).isActive = true
    milieuImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 225/320).isActive = true
    milieuImage.heightAnchor.constraint(equalToConstant: 154).isActive = true
    
    milieuDescription.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 38).isActive = true
    milieuDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
    milieuDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
    milieuDescription.text = "Du bist ein Hedonist. Hedonisten zeichnen sich dadurch aus, dass sie sich in dem Eskapismus hingeben und möglichst frei von Zwängen sein möchten. Du triffst viele Hedonisten in den trendeigen Vierteln von großen Städten. Wahrscheinlich wohnst du auch in einer Stadt? Hedonisten haben meistens leider nicht viel Geld sind aber kulturell aufgeschlossen und haben ein sehr gutes Netz von sozialen Kontakten."
    
    lebensweltLabel.topAnchor.constraint(equalTo: milieuDescription.bottomAnchor, constant: 38).isActive = true
    lebensweltLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
    
    
    lebensweltImage1.topAnchor.constraint(equalTo: lebensweltLabel.bottomAnchor, constant: 26).isActive = true
    lebensweltImage1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
    lebensweltImage1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 40/100).isActive = true
    lebensweltImage1.heightAnchor.constraint(equalTo: lebensweltImage1.widthAnchor, multiplier: 129/100).isActive = true
    
    lebensweltImage2.topAnchor.constraint(equalTo: lebensweltLabel.bottomAnchor, constant: 26).isActive = true
    lebensweltImage2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
    lebensweltImage2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 40/100).isActive = true
    lebensweltImage2.heightAnchor.constraint(equalTo: lebensweltImage1.widthAnchor, multiplier: 129/100).isActive = true
    lebensweltImage2.leftAnchor.constraint(equalTo: lebensweltImage1.rightAnchor, constant: 12).isActive = true
    
    lebensweltImage3.topAnchor.constraint(equalTo: lebensweltImage1.bottomAnchor, constant: 12).isActive = true
    lebensweltImage3.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
    lebensweltImage3.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
    lebensweltImage3.heightAnchor.constraint(equalTo: lebensweltImage3.widthAnchor, multiplier: 100/129).isActive = true
    
    lebensweltImage4.topAnchor.constraint(equalTo: lebensweltImage3.bottomAnchor, constant: 12).isActive = true
    lebensweltImage4.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26).isActive = true
    lebensweltImage4.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 40/100).isActive = true
    lebensweltImage4.heightAnchor.constraint(equalTo: lebensweltImage4.widthAnchor, multiplier: 129/100).isActive = true
    lebensweltImage4.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
    
    lebensweltImage5.topAnchor.constraint(equalTo: lebensweltImage3.bottomAnchor, constant: 12).isActive = true
    lebensweltImage5.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
    lebensweltImage5.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 40/100).isActive = true
    lebensweltImage5.leftAnchor.constraint(equalTo: lebensweltImage4.rightAnchor, constant: 12).isActive = true
    lebensweltImage5.heightAnchor.constraint(equalTo: lebensweltImage5.widthAnchor, multiplier: 129/100).isActive = true
    lebensweltImage5.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
    
    
    
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lebensweltImage1.layer.cornerRadius = 6
        lebensweltImage1.clipsToBounds = true
        
        lebensweltImage2.layer.cornerRadius = 6
        lebensweltImage2.clipsToBounds = true
        
        lebensweltImage3.layer.cornerRadius = 6
        lebensweltImage3.clipsToBounds = true
        
        lebensweltImage4.layer.cornerRadius = 6
        lebensweltImage4.clipsToBounds = true
        
        lebensweltImage5.layer.cornerRadius = 6
        lebensweltImage5.clipsToBounds = true
    }
       

}

