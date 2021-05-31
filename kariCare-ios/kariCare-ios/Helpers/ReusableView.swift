//
//  ReusableView.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String{
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView{}
extension UITableViewCell: ReusableView{}

protocol NibLoadableView {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView{
    static var nibName: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
