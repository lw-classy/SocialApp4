//
//  MilieuModelNames.swift
//  SocialApp4
//
//  Created by LevinJungstier on 09.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation

enum MilieuViewModelItemType {
    case name
    case image
    case description
    case collectionView
}

protocol MilieuViewModelItem {
    var type: MilieuViewModelItemType {get}
    var rowCount: Int {get}
    
}

extension MilieuViewModelItem {
    var rowCount:Int {
        return 1
    }
}

class MilieuModelItemName: MilieuViewModelItem {
    
    
    var type: MilieuViewModelItemType {
        return .name
    }
    
    var milieuname: String
    
    init(milieuname:String) {
        self.milieuname = milieuname
    }
    
    
}


class MilieuModellItemImage: MilieuViewModelItem {
    var type: MilieuViewModelItemType {
        return .image
    }
    
    var milieuImage : String
    
    init(milieuImage:String){
        self.milieuImage = milieuImage
    }
}


class MilieuModelItemDescription: MilieuViewModelItem {
    var type: MilieuViewModelItemType{
        return .description
        
    }
    
    var milieuDescription : String
    
    init(milieuDescription: String){
        self.milieuDescription = milieuDescription
    }
}

class MilieuCollectionItems {
    var items = [Milieu]()
    
    var rowCount: Int {
        return items.count
    }
    
    
    init(items:[Milieu]){
        self.items = items
    }
}
