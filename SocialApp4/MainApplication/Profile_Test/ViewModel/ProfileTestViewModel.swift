//
//  ProfileTestViewModel.swift
//  SocialApp4
//
//  Created by LevinJungstier on 28.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import Firebase

protocol DatasFetchedDelegate{
    func didFetchedDatas(datas: User)
}

protocol DatasFetchedMilieus {
    func didFetchedMilieus()
}

class ProfileTestViewModel: NSObject {
    
    var delegate : DatasFetchedDelegate?
    var delegateMilieu : DatasFetchedMilieus?
    var items = [User]()
    var milieus = [Milieu]()
    
    
    func loadDatas(){
        UserApi.shared.getCurrentUser { [weak self] (user) in
            self?.items.removeAll()
            self?.items.insert(user, at: 0)
        
            self?.delegate?.didFetchedDatas(datas: user)
        }
        
        MilieuApi.shared.getMilieus { [weak self](milieu) in
            
            self?.milieus.insert(milieu, at: 0)
         
            self?.delegateMilieu?.didFetchedMilieus()
            
        }
    }
    
}


extension ProfileTestViewModel:UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return milieus.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let item = milieus[indexPath.row]
          
          if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as? MilieuCollectionViewCell{
              cell.item = item
              
          return cell
          }
          return UICollectionViewCell()
          
      }
    
    
}
