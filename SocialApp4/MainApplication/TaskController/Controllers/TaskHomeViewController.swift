//
//  TaskHomeViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 15.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class TaskHomeViewController: UIViewController, DidFinishTaskLaunch, DidFinishLoadTask, TaskDetailDelegate {
    
    
    let controllerTitle = "Task"
    
    func didPushButton(data: Task) {
        let detailController = TaskViewController()
        detailController.viewModel = TaskDetailViewModel(task: data)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    
    func didFinishLoadTask() {
        taskView.reloadData()
    }
    
  
    func didFinishTaskLaunch(data: User) {
        
      
     guard let culture = data.culturalCapital else {return}
        guard let eco = data.economicalCapital else {return}
        guard let social = data.socialCapital else {return}
        guard let profileImg = data.profileImgUrl else {return}
        guard let url = URL(string:profileImg) else {return}
        guard let profileName = data.username else {return}
        guard let milieu = data.milieu else {return}
        let milieuImage = "prekar" 
        
        taskHomeView.nameLabel.text = profileName
        taskHomeView.milieuImage.image = UIImage(named: milieuImage)
        taskHomeView.cultureLabel.valueLabel.text = "\(culture)"
        taskHomeView.economicLabel.valueLabel.text = "\(eco)"
        taskHomeView.socialLabel.valueLabel.text = "\(social)"
        taskHomeView.profileImage.sd_setImage(with: url) { (_, _, _, _) in}
        taskHomeView.milieuLabel.text = milieu
        
        
    }
    
   
    
    var viewModel = TaskViewModel()
    let taskHomeView = TaskHomeView()
    let taskView = TaskList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel(frame:CGRect(x: view.frame.width,y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = controllerTitle
        titleLabel.textAlignment = .right
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        self.navigationItem.titleView = titleLabel
        
        self.view.addSubview(taskHomeView)
        self.view.addSubview(taskView)
         
        
        taskView.register(TaskCell.self, forCellWithReuseIdentifier: "taskView")
        taskView.delegate = viewModel
        taskView.dataSource = viewModel
        
        
        
        self.view.backgroundColor = .backgroundColorBlack
         
        viewModel.delegate = self
        viewModel.delegateTasks = self
        viewModel.delegateDetail = self
        viewModel.loadDatas()
       

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    
    func setupView(){
        
        taskHomeView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        taskHomeView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        taskHomeView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        taskHomeView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 148/460).isActive = true
        
        taskView.topAnchor.constraint(equalTo: taskHomeView.bottomAnchor).isActive = true
        taskView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        taskView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        taskView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    


}








