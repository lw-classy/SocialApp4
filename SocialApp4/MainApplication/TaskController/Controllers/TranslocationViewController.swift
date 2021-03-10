//
//  TranslocationViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 26.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class TranslocationViewController: UIViewController {
    let taskHomeView = TaskHomeView()
    let marker = OuterCircle()
    let buttonView : UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColorBlack
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var markerConstantY : NSLayoutConstraint!
    var markerConstantX : NSLayoutConstraint!
   

    let milieuLocationView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundColorBlack
        return view
    }()
    let milieuMilieusImageView : UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Milieus")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let button = Button()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(taskHomeView)
        self.view.addSubview(milieuLocationView)
       
        
      
        milieuLocationView.addSubview(milieuMilieusImageView)
        milieuLocationView.addSubview(marker)
        
        self.view.addSubview(buttonView)
        

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        placeSubviews()
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.marker.bottomAnchor.constraint(equalTo: self.milieuMilieusImageView.bottomAnchor, constant:-12).isActive = false
                self.marker.leftAnchor.constraint(equalTo: self.milieuMilieusImageView.leftAnchor, constant: 90).isActive = false
                self.marker.bottomAnchor.constraint(equalTo: self.milieuMilieusImageView.bottomAnchor, constant:-12).isActive = true
                self.marker.leftAnchor.constraint(equalTo: self.milieuMilieusImageView.leftAnchor, constant: 80).isActive = true
            })
            
        }
        
    }
    
    
    func placeSubviews() {
        
        taskHomeView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        taskHomeView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        taskHomeView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        taskHomeView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 148/460).isActive = true
        
        milieuLocationView.topAnchor.constraint(equalTo: taskHomeView.bottomAnchor).isActive = true
        milieuLocationView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        milieuLocationView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        milieuLocationView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 160/460).isActive = true
        
        milieuMilieusImageView.topAnchor.constraint(equalTo: milieuLocationView.topAnchor, constant: 20).isActive = true
        milieuMilieusImageView.bottomAnchor.constraint(equalTo: milieuLocationView.bottomAnchor, constant: -20).isActive = true
        milieuMilieusImageView.leftAnchor.constraint(equalTo: milieuLocationView.leftAnchor, constant: 26).isActive = true
        milieuMilieusImageView.rightAnchor.constraint(equalTo: milieuLocationView.rightAnchor, constant: -26).isActive = true
        
        marker.heightAnchor.constraint(equalToConstant: 20).isActive = true
        marker.widthAnchor.constraint(equalToConstant: 20).isActive = true
        marker.bottomAnchor.constraint(equalTo: milieuMilieusImageView.bottomAnchor, constant:-12).isActive = true
        marker.leftAnchor.constraint(equalTo: milieuMilieusImageView.leftAnchor, constant: 90).isActive = true
        
        
        buttonView.topAnchor.constraint(equalTo: milieuLocationView.bottomAnchor).isActive = true
        buttonView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        buttonView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        buttonView.addSubview(button)
        
        button.leftAnchor.constraint(equalTo: buttonView.leftAnchor, constant: 26).isActive = true
        button.rightAnchor.constraint(equalTo: buttonView.rightAnchor, constant: -26).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        button.setTitle("Fertig", for: .normal)
        button.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
    }
    
   
    @objc func pushButton(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
  
}


    
    
    
    
 
    
   
    




