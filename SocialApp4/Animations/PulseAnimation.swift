//
//  PulseAnimation.swift
//  SocialApp4
//
//  Created by LevinJungstier on 26.01.20.
//  Copyright © 2020 LevinJungstier. All rights reserved.
//

import Foundation
import UIKit

class PulseAnimation : CALayer {
    var animationGroup = CAAnimationGroup()
    var animationDuration : TimeInterval = 1.0
    var radius : CGFloat = 200
    var numberOfPulse : Float = 10
    
    override init(layer: Any) {
        super.init(layer:layer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numberOfPulse: Float = Float.infinity, radius: CGFloat, position: CGPoint){
        super.init()
        self.backgroundColor = UIColor.white.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulse = numberOfPulse
        self.position = position
        
        self.bounds = CGRect(x:0, y:0, width: radius*2, height: radius*2)
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: .default).async {
            self.setUpAnimationGroup()
            
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
            
        }
        
    }
    
    
    func scaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: 0)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        
        return scaleAnimation
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        opacityAnimation.values = [0.2,0.53,0.0]
        opacityAnimation.keyTimes = [0, 0.3, 1]
        
        return opacityAnimation
        
    }
    
    
    func setUpAnimationGroup(){
        self.animationGroup.duration = animationDuration
        self.animationGroup.repeatCount = numberOfPulse
        
        let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAnimation(),createOpacityAnimation()]
    }
    
}
