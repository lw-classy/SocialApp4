//
//  HomeTestViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 23.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class HomeTestViewController: UIViewController, DatasFetchedDelegate, DatasFetchedMilieus {
    
    let controllerTitle = "Profile"
    
    func didFetchedMilieus() {
        lastMilieus.reloadData()
    }
    
    
    func didFetchedDatas(datas: User) {
        
        guard let culture = datas.culturalCapital else {return}
        guard let eco = datas.economicalCapital else {return}
        guard let social = datas.socialCapital else {return}
        guard let profileImg = datas.profileImgUrl else {return}
        guard let url = URL(string:profileImg) else {return}
        guard let profileName = datas.username else {return}
        guard let milieu = datas.milieu else {return}
        
        profileView.userName.text = profileName
        profileView.cultureLabel.valueLabel.text = "\(culture)"
        profileView.economicLabel.valueLabel.text = "\(eco)"
        profileView.socialLabel.valueLabel.text = "\(social)"
        profileView.profileImage.sd_setImage(with: url) { (_, _, _, _) in}
        profileView.milieuName.text = milieu
        
    }
    
    
    
    
    var viewModel = ProfileTestViewModel()
       
    
    let profileView = ProfileHeader()
    
    let lastMilieus = MilieuList()
    
    var myHeightConstraint : NSLayoutConstraint!
    let maxContentHeight: CGFloat  = 300
    let minContentHeight: CGFloat = 91
    var previousScrollOffset: CGFloat = 0
    var previousScrollViewHeight: CGFloat = 0

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile"
        let titleLabel = UILabel(frame:CGRect(x: view.frame.width,y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = controllerTitle
        titleLabel.textAlignment = .right
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        self.navigationItem.titleView = titleLabel

        lastMilieus.register(MilieuCollectionViewCell.self, forCellWithReuseIdentifier: "profileCell")
        lastMilieus.delegate = self
        lastMilieus.dataSource = viewModel
        
        
       
        
        self.view.addSubview(profileView)
        self.view.addSubview(lastMilieus)
        
        
        
        
        viewModel.delegate = self
        viewModel.delegateMilieu = self
        viewModel.loadDatas()
        
      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        profileView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        profileView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        myHeightConstraint = profileView.heightAnchor.constraint(equalToConstant: maxContentHeight)
        myHeightConstraint.isActive = true
        lastMilieus.topAnchor.constraint(equalTo: profileView.bottomAnchor).isActive = true
        lastMilieus.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        lastMilieus.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        lastMilieus.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
       
        
              

        
    }
    
   
    
    
    

}


extension HomeTestViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Always update the previous values
        defer {
            self.previousScrollViewHeight = scrollView.contentSize.height
            self.previousScrollOffset = scrollView.contentOffset.y
        }

        let heightDiff = scrollView.contentSize.height - self.previousScrollViewHeight
        let scrollDiff = (scrollView.contentOffset.y - self.previousScrollOffset)

        // If the scroll was caused by the height of the scroll view changing, we want to do nothing.
        guard heightDiff == 0 else { return }

        let absoluteTop: CGFloat = 0;
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height;

        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom

        if canAnimateHeader(scrollView) {

            // Calculate new header height
            var newHeight = self.myHeightConstraint.constant
            if isScrollingDown {
                newHeight = max(self.minContentHeight, self.myHeightConstraint.constant - abs(scrollDiff))
            } else if isScrollingUp {
                newHeight = min(self.maxContentHeight, self.myHeightConstraint.constant + abs(scrollDiff))
            }

            // Header needs to animate
            if newHeight != self.myHeightConstraint.constant {
                self.myHeightConstraint.constant = newHeight
                self.updateHeader()
                self.setScrollPosition(self.previousScrollOffset)
            }
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidStopScrolling()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
      
    }

    func scrollViewDidStopScrolling() {
       
        let range = self.maxContentHeight - self.minContentHeight
        let midPoint = self.minContentHeight + (range / 2)

        if self.myHeightConstraint.constant > midPoint {
            self.expandHeader()
        } else {
            self.collapseHeader()
        }
    }

    func canAnimateHeader(_ scrollView: UIScrollView) -> Bool {
        // Calculate the size of the scrollView when header is collapsed
        let scrollViewMaxHeight = scrollView.frame.height + self.myHeightConstraint.constant - minContentHeight

        // Make sure that when header is collapsed, there is still room to scroll
        return scrollView.contentSize.height > scrollViewMaxHeight
    }

    func collapseHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.myHeightConstraint.constant = self.minContentHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }

    func expandHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.myHeightConstraint.constant = self.maxContentHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
        
    }

    func setScrollPosition(_ position: CGFloat) {
        self.lastMilieus.contentOffset = CGPoint(x: self.lastMilieus.contentOffset.x, y: position)
    }

    func updateHeader() {
        let range = self.maxContentHeight - self.minContentHeight
        let openAmount = self.myHeightConstraint.constant - self.minContentHeight
        let percentage = openAmount / range
        
        
        profileView.profileImage.alpha = percentage
        profileView.profileImage.transform = CGAffineTransform(translationX: 0, y: -percentage)
        profileView.milieuName.alpha = percentage
        profileView.userName.alpha = percentage

        
    }
    
    
}



