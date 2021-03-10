//
//  TaskCell.swift
//  SocialApp4
//
//  Created by LevinJungstier on 15.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class TaskCell : UICollectionViewCell {
    
    var item: Task? {
        didSet{
               
            tasklabel.text = item?.task
            subTask.text = item?.subtitle
    }
    }
    
    let tasklabel : UILabel = {
        let taskLabel = UILabel()
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.font = .boldSystemFont(ofSize: 12)
        taskLabel.textAlignment = .center
        taskLabel.textColor = .white
        
        return taskLabel
    }()
    let subTask : UILabel = {
        let subTask = UILabel()
        subTask.translatesAutoresizingMaskIntoConstraints = false
        subTask.font = .systemFont(ofSize: 9)
        subTask.textAlignment = .center
        subTask.numberOfLines = 2
        subTask.textColor = .white
        
        return subTask
    }()
 
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = .elementBlack
   
        
        addSubview(tasklabel)
        addSubview(subTask)
        
        tasklabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        tasklabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        tasklabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        tasklabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tasklabel.text = "das ist eine Kiurze Aufgabe"
        
        subTask.topAnchor.constraint(equalTo: tasklabel.bottomAnchor, constant: 9).isActive = true
        subTask.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        subTask.rightAnchor.constraint(equalTo: self.rightAnchor, constant:-12).isActive = true
        subTask.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subTask.text = "eine kleinere Erklärung was du dann genau machst zum beispiel Spazieren gehen mit nazis aber ud bist kein Nazi hahaha"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
