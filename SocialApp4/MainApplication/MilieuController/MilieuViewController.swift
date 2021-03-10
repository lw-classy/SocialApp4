//
//  MilieuViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 09.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class MilieuViewController: UIViewController, MilieuViewModelDelegate,MilieuDetailDelegate {

    fileprivate var viewModel = MilieuViewModel()
    let collectionView = MilieuList()
    let controllerTitle = "Milieus"
   
    
    override func viewDidLoad() {
        
        
        self.navigationItem.title = controllerTitle
        
        let titleLabel = UILabel(frame:CGRect(x: view.frame.width,y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = controllerTitle
        titleLabel.textAlignment = .right
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        self.navigationItem.titleView = titleLabel
        
        
        
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundColorBlack
        self.view.addSubview(collectionView)
        layoutcollectionView()
        collectionView.register(MilieuCollectionViewCell.self, forCellWithReuseIdentifier: "collectionView")
        
        layoutcollectionView()
        
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        viewModel.delegate = self
        viewModel.detailDelegate = self
        viewModel.loadData()
       
        
        
    }
    
    
    func didFinishLoading() {
        collectionView.reloadData()
    }
    
    
  
    func didButtonTapped(data: Milieu) {
        let detailController = MilieuDetailViewController()
        detailController.viewModel = MilieuDetailViewModel(milieu: data)
        
        self.navigationController?.pushViewController(detailController, animated: true)
        
        
    }
    

   
   
    
    
    func layoutcollectionView(){
        
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}





