//
//  TaskNavigationController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 15.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class TaskNavigationController: UINavigationController {

    let taskHomeViewController = TaskHomeViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [taskHomeViewController]
         self.navigationItem.title = "Task"
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
