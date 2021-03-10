//
//  TaskViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 02.02.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, DidFinishLoadTaskDetail {
    func didFinishLoadTaskDetail() {
        taskView.item = viewModel.items[0]
        taskView.layoutIfNeeded()
    }
    
    
    let taskView = TaskInfoView()
    var viewModel : TaskDetailViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(taskView)
        viewModel.delegateSelf = self
        viewModel.loading()
        self.layoutView()
        
        taskView.actionButton.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
    }
    
    
    private func layoutView(){
        taskView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        taskView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        taskView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        taskView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
    
    @objc func pushButton(){
        let translocController = TranslocationViewController()
        navigationController?.pushViewController(translocController, animated: true)
        
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
