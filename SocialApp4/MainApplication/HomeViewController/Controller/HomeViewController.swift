//
//  HomeViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 07.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, ProfileViewModelDelegate {
    


    
    fileprivate let viewModel = ProfileViewModel()
    
    
    var table = StartTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setUpNavigationBar()
        self.navigationItem.title = ""
        self.title = "Home"
        self.view.addSubview(table)
        setUpTable()
        table.dataSource = viewModel
        table.delegate = viewModel
        
        
        
        table.register(NameCell.self, forCellReuseIdentifier: "cell")
        
        
        viewModel.delegate = self
        viewModel.loadData()
        
        
      
     

    }
    
    func didFinishUpdates() {
        table.reloadData()
    }
    
    func setUpTable(){
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    func setUpNavigationBar(){
        
        /*
       let logoImage = UIImage.init(named: "Logo")
           let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x:-40,y: 0, width:102,height: 12)
        logoImageView.contentMode = .scaleAspectFit
           let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
           negativeSpacer.width = -25
           navigationItem.leftBarButtonItems = [negativeSpacer, imageItem]
        
          */
    }
    
    
    
    
    
        
}


extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0 {
           
        }else if scrollView.contentOffset.y > 50 {
      
        }
    }
}



