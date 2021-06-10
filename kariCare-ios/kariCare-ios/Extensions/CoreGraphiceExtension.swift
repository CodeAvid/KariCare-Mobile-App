//
//  CoreGraphiceExtension.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 05/06/2021.
//

import UIKit

extension CALayer{
    func removeLayerIfExists(_ view: UIView){
        if let lastLayer = view.layer.sublayers?.last{
            let isPresent = lastLayer is ShimmerLayer
                if isPresent{
                    self.removeFromSuperlayer()
                }
            }
        }
}
