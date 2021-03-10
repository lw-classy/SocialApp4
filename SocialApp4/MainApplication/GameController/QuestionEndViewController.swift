//
//  QuestionEndViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 30.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class QuestionEndViewController: UIViewController {

    var viewModel : QuestionEndViewModel!
    let endView = QuestionEndView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(endView)
        self.placeView()
        
        endView.actionButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
    }
    
    
    func placeView(){
        endView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        endView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        endView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        endView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    
    @objc func handleButton(){
        self.navigationController?.popToRootViewController(animated: true)
        let tabBarController = MainTabBarController()
        tabBarController.selectedIndex = 0
    }
    


}
