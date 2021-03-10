//
//  HomeNavigationController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 08.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController {
    
    let homeViewController = HomeViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [homeViewController]
        
        self.navigationBar.barTintColor = .backgroundColorBlack
        self.navigationBar.tintColor = .white
        

        // Do any additional setup after loading the view.
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
