//
//  StartTableView.swift
//  SocialApp4
//
//  Created by LevinJungstier on 08.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class StartTableView: UITableView {

    
    override init(frame: CGRect, style: UITableView.Style) {
        
        let style = UITableView.Style.plain
        
        
        super.init(frame: frame, style: style)
        
        
        
        
        self.backgroundColor = .backgroundColorBlack
        
        self.separatorInset = .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
