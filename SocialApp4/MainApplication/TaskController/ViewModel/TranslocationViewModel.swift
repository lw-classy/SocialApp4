//
//  TranslocationViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 05.02.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation

protocol DidFetchTranslocatedData {
    func didFetchTranslocatedData()
}
class TranslocationViewModel: NSObject {
    
    var didFetchTranslocatedData : DidFetchTranslocatedData!
    var profile = [User]()
    
    func loadProfile(){
              UserApi.shared.getCurrentUser { [weak self] (user) in
              self?.profile.removeAll()
              self?.profile.insert(user, at: 0)
              self?.didFetchTranslocatedData?.didFetchTranslocatedData()
              
        }
    }
    
    
    
}
