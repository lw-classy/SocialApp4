//
//  TaskViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 28.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import Firebase

protocol DidFinishTaskLaunch {
    func didFinishTaskLaunch(data: User)
}

protocol DidFinishLoadTask {
    func didFinishLoadTask()
}

protocol TaskDetailDelegate {
    func didPushButton(data: Task)
}

class TaskViewModel: NSObject {
    
    var delegate : DidFinishTaskLaunch?
    var delegateTasks : DidFinishLoadTask?
    var delegateDetail : TaskDetailDelegate?
    var items = [User]()
    var tasks = [Task]()
    
    
    func loadDatas(){
        UserApi.shared.getCurrentUser { [weak self] (user) in
            self?.items.removeAll()
            self?.items.insert(user, at: 0)
            self?.delegate?.didFinishTaskLaunch(data: user)
            
        }
        
        TaskApi.shared.getTasks {[weak self] (task) in
            self?.tasks.insert(task, at: 0)
            self?.delegateTasks?.didFinishLoadTask()
        }
        
        
    }
    
}


extension TaskViewModel: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = tasks[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "taskView", for: indexPath) as? TaskCell {
        cell.item = item
        return cell
            
        }
        return UICollectionViewCell()
        
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/100 * CGFloat(88), height: collectionView.frame.size.height/100*CGFloat(22))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        delegateDetail?.didPushButton(data: task)
        
    }
    
    
    
}
