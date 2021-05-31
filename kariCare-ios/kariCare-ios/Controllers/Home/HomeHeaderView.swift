//
//  HomeHeaderView.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import UIKit


class HomeHeaderView: UICollectionReusableView{
    
    static var reuseIdentifier = String(describing: ProfileHeaderView.self)
    
    private let titleLabel = UILabel(text: Constants.HomeVC.title, textColor: .label, font: UIFont.boldSystemFont(ofSize: 30))
    
    private let  roundView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.constrainHeight(constant: 14)
        view.constrainWidth(constant: 14)
        view.layer.cornerRadius = 7.0
        view.clipsToBounds = true
        return view
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image  = UIImage(named: Constants.Images.profileImage)
        imageView.backgroundColor = UIColor.gray
        imageView.contentMode = .scaleAspectFill
        imageView.constrainHeight(constant: 40)
        imageView.constrainWidth(constant: 40)
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    
    private lazy var leftStackView = HorizontalStackView(arrangedSubviews: [titleLabel, roundView], spacing: 10)
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftStackView.alignment = .center
        profileImage.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        let contentContainer = HorizontalStackView(arrangedSubviews: [leftStackView, UIView(), profileImage], spacing: 10)
        contentContainer.alignment = .center
        addSubview(contentContainer)
        contentContainer.fillSuperview()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
