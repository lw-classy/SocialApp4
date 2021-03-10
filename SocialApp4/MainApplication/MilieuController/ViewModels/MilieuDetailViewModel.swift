//
//  MilieuDetailViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 10.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import UIKit


protocol MilieuDetailDelegateLoading{
   func didFinishLoading()
}

class MilieuDetailViewModel: NSObject {
    
    var delegate : MilieuDetailDelegateLoading?
    
 
    var milieu : Milieu!
    
    var items = [Milieu]()
  
    init(milieu: Milieu){
        self.milieu = milieu
    }
    
    func loading() {
        
        items.removeAll()
        items.insert(milieu, at: 0)
        delegate?.didFinishLoading()
        
    }
    
}

extension MilieuDetailViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "milieuDetail", for: indexPath) as! MilieuDetailCell
        cell.item = item
        cell.selectionStyle = .none
        return cell
        
    }
    
    
    
    
}



