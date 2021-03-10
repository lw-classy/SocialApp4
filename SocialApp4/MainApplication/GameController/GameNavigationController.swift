//
//  GameNavigationController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 12.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit
import ResearchKit

class GameNavigationController: UINavigationController{
    
    let controllerTitle = "Kapital"
  
    let startViewController = SurveyStartViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [startViewController]
        self.navigationItem.title = "Kapital"
        let titleLabel = UILabel(frame:CGRect(x: view.frame.width,y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = controllerTitle
        titleLabel.textAlignment = .right
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        self.navigationItem.titleView = titleLabel
        self.isNavigationBarHidden = true
        
    }
    
    
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


