//
//  MilieuViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 09.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import UIKit

protocol MilieuViewModelDelegate {
    func didFinishLoading()
}

protocol MilieuDetailDelegate {
    func didButtonTapped(data: Milieu)
}





class MilieuViewModel: NSObject{
    
    var delegate : MilieuViewModelDelegate?
    var detailDelegate: MilieuDetailDelegate?
    
    
    
    var items = [Milieu]()
    
  
 
    var loadedIdx : [Int] = []
     
   
    
    
    func loadData(){
        MilieuApi.shared.getMilieus { [weak self](milieu) in
            
            self?.items.insert(milieu, at: 0)
         
            self?.delegate?.didFinishLoading()
            
        }
    }
    
    
    
}

extension MilieuViewModel: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as? MilieuCollectionViewCell{
            cell.item = item
            
        return cell
        }
        return UICollectionViewCell()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        let milieu = items[indexPath.row]
        detailDelegate?.didButtonTapped(data: milieu)
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (!loadedIdx.contains(indexPath.row)) {
            let cellContent = cell
            let offsetPositioning = CGPoint(x: 0, y: collectionView.bounds.size.height/2	)
            var transform = CATransform3DIdentity
               
            transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50)

               cellContent.layer.transform = transform
               cellContent.layer.opacity = 0.2

            let delay = 0.06 * Double(indexPath.row)
            
            UIView.animate(withDuration: 0.8, delay:delay , usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
                   cellContent.layer.transform = CATransform3DIdentity
                   cellContent.layer.opacity = 1
               }) { (Bool) -> Void in

               }

               loadedIdx.append(indexPath.row)
           }
    }
    
}



