//
//  TaskList.swift
//  SocialApp4
//
//  Created by LevinJungstier on 15.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class TaskList: UICollectionView {

    
   override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            
            let paddingRightLeft = UIScreen.main.bounds.size.width/100*CGFloat(6)
     
            flowLayout.sectionInset = UIEdgeInsets(top: paddingRightLeft, left: paddingRightLeft, bottom: paddingRightLeft, right: paddingRightLeft)
            
            super.init(frame:frame, collectionViewLayout: flowLayout)
            
            
            self.translatesAutoresizingMaskIntoConstraints = false
            self.backgroundColor = .backgroundColorBlack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

