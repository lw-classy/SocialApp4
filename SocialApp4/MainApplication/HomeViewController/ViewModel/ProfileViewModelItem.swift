//
//  ProfileViewModelItem.swift
//  SocialApp4
//
//  Created by LevinJungstier on 07.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation

enum ProfileViewModelItemType {
    case name
}

protocol ProfileViewmodelItem {
    var type: ProfileViewModelItemType {get}
    var rowCount: Int {get}
    
}

extension ProfileViewmodelItem {
    var rowCount:Int {
        return 1
    }
}
