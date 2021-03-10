//
//  ProfileViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 07.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import UIKit


protocol ProfileViewModelDelegate: class{
   func didFinishUpdates()
}

class ProfileViewModel: NSObject {
    
    var delegate: ProfileViewModelDelegate?

    var items = [ProfileViewmodelItem]()
    
    
    
  
    
    func loadData(){
        UserApi.shared.getCurrentUser {[weak self] (user) in
            self?.items.removeAll()
            print(user)
            guard let user = user.username else {return}
            let currentUser = ProfileViewModelName(username: user)
            self?.items.append(currentUser)
            self?.delegate?.didFinishUpdates()
            }
        }
    
}
    
   
       



extension ProfileViewModel: UITableViewDataSource, UITableViewDelegate {
    
   func numberOfSections(in tableView: UITableView) -> Int {
      return items.count
   }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return items[section].rowCount
   }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.section]
    switch item.type {
    case .name:
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NameCell {
            cell.item = item
            return cell
        }
   }
    return UITableViewCell()
    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.section]
        switch item.type {
        case .name:
            return CGFloat(signOf: tableView.frame.width, magnitudeOf: tableView.frame.height/(100/22))
        }
        return CGFloat(signOf: tableView.frame.width, magnitudeOf: 0)
    }
    
}
