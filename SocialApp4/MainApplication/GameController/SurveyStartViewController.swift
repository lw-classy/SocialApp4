//
//  SurveyStartViewController.swift
//  SocialApp4
//
//  Created by LevinJungstier on 13.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import UIKit

class SurveyStartViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .backgroundColorBlack
        
        let button = Button()
        let logoView :  UIImageView = {
            let logoImageView = UIImageView()
            let image = UIImage(named: "Logo")
            logoImageView.image = image
            logoImageView.contentMode = .scaleAspectFit
            logoImageView.translatesAutoresizingMaskIntoConstraints = false
            return logoImageView
        }()
        
        self.view.addSubview(logoView)
        self.view.addSubview(button)
        
        
        logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:  12).isActive = true
        logoView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/2).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:  -120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 26).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -26).isActive = true
        button.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        button.setTitle("Neues Kapital anfordern".uppercased(), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func pushButton(){
        pushNewViewController()
    }
    
    func pushNewViewController(){
        let newQuestionController = SurveyQuestionViewController()
        newQuestionController.viewModel = SurveyQuestionViewModel()
        
        newQuestionController.viewModel.update(questionIndex: 1)
       
        navigationController?.pushViewController(newQuestionController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
