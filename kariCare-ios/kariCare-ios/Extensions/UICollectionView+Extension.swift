//
//  UICollectionView+Extension.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

extension UICollectionView{
    
    func register<T: UICollectionViewCell>(_ : T.Type){
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Collection View Cell")
        }
        return cell
    }

}
