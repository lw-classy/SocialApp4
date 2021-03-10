
//
//  MilieuDetailViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 09.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class MilieuDetailViewController: UIViewController,  MilieuDetailDelegateLoading{
  
    var viewModel: MilieuDetailViewModel!
   
    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(table)
        table.frame.size = self.view.frame.size
       
        table.tableFooterView = UIView()
        table.dataSource = viewModel
        table.delegate = self
        viewModel.delegate = self
        viewModel.loading()
        table.register(MilieuDetailCell.self, forCellReuseIdentifier: "milieuDetail")
        
        
    
        
        table.separatorColor = .clear
        table.tableFooterView = UIView()
      
        
      
        
        
        table.estimatedRowHeight = 440.0;
        table.rowHeight = UITableView.automaticDimension;
        table.backgroundColor = .backgroundColorBlack
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func didFinishLoading() {
        table.reloadData()
    }
    
    
    
  
 
    
}
extension MilieuDetailViewController: UITableViewDelegate {
    
}






