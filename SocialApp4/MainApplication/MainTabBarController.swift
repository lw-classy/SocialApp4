//
//  MainTabBarController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 08.02.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let taskNavigationController = TaskNavigationController()
    let homeTestNavigationController = HomeTestNavigationController()
    let gameNavigationController = GameNavigationController()
    let milieuNavigationController = MilieuNavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.viewControllers = [taskNavigationController, homeTestNavigationController, gameNavigationController, milieuNavigationController]
        
        taskNavigationController.title = "Task"
        homeTestNavigationController.title = "Profile"
        gameNavigationController.title = "Kapital"
        milieuNavigationController.title = "Milieus"
        
        taskNavigationController.navigationItem.title = "Task"
        homeTestNavigationController.navigationItem.title = "Profile"
        gameNavigationController.navigationItem.title = "Kapital"
        milieuNavigationController.navigationItem.title = "Milieus"
        
        taskNavigationController.tabBarItem.image = UIImage(named: "fragebogenUnselected")
        homeTestNavigationController.tabBarItem.image = UIImage(named: "profileUnselected")
        gameNavigationController.tabBarItem.image = UIImage(named: "fragebogenUnselected")
        milieuNavigationController.tabBarItem.image = UIImage(named: "milieuUnselected")
        
        
        UITabBar.appearance().tintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
        
        
        
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
