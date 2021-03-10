//
//  ProfileViewModelName.swift
//  SocialApp4
//
//  Created by LevinJungstier on 07.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation


class ProfileViewModelName: ProfileViewmodelItem {
    
    
    var type: ProfileViewModelItemType {
        return .name
    }
    
    var username: String
    
    init(username:String) {
        self.username = username
    }
    
    
}
