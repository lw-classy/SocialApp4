//
//  MilieuList.swift
//  SocialApp4
//
//  Created by LevinJungstier on 09.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class MilieuList: UICollectionView {

    
   override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
            let flowLayout = UICollectionViewFlowLayout()
    
        
            let width = UIScreen.main.bounds.size.width/100 * CGFloat(38.75)
            let height = UIScreen.main.bounds.size.height/100 * CGFloat(28.34)
            let inset = UIScreen.main.bounds.size.width/100 * CGFloat(8.75)
            let padding = UIScreen.main.bounds.size.width/100 * CGFloat(5.9)
            flowLayout.sectionInset = UIEdgeInsets(top:inset, left: inset, bottom: inset, right: inset)
            
            flowLayout.itemSize = CGSize(width: width, height: height)
           
            
        
            super.init(frame:frame, collectionViewLayout: flowLayout)
            self.translatesAutoresizingMaskIntoConstraints = false
            flowLayout.minimumLineSpacing = padding
            self.backgroundColor = .backgroundColorBlack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
