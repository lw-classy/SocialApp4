//
//  TaskDetailViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 31.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import UIKit

protocol DidFinishLoadTaskDetail {
    func didFinishLoadTaskDetail()
}

protocol DidPushTrans {
    func didPushTrans()
}

class TaskDetailViewModel: NSObject {
    
    var delegateSelf : DidFinishLoadTaskDetail?
    var didPushTrans: DidPushTrans?
    
    
    var task : Task!
      
    var items = [Task]()
    
      init(task: Task){
          self.task = task
      }
    
    
    func loading() {
        
        items.removeAll()
        items.insert(task, at: 0)
        delegateSelf?.didFinishLoadTaskDetail()
        
        print(items)
        
        
        
    }
      
}



    
    
    
    
    
    
