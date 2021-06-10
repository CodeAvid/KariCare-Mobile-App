//
//  ShimmerLayer.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 04/06/2021.
//

import UIKit

final class ShimmerLayer: CAGradientLayer {
    
    // MARK:- initialisers for the CALayer
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(for view: UIView, cornerRadius: CGFloat){
        super.init()
        
        self.frame = view.frame
        self.startPoint = CGPoint(x: 0.0, y: 1.0)
        self.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.colors = [UIColor.gradientDarkGrey.cgColor, UIColor.gradientLightGrey, UIColor.gradientDarkGrey]
        self.locations = [0.0, 0.5, 1.0]
        self.cornerRadius = cornerRadius
        
        DispatchQueue.main.async {
            self.startAnimation()
        }
    }
    
    func startAnimation(){
        let animation = CABasicAnimation(keyPath: Constants.ShimmerLayer.animationKeyPath)
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.7
        self.add(animation, forKey: animation.keyPath)
    }
    
    func removeAnimation() {
        self.removeAllAnimations()
    }
}
