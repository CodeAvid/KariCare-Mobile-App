//
//  LiveBagdeView.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 30/05/2021.
//

import UIKit

class LiveBagdeView: UIView{
    
    static let reuseIdentifier = String(describing: self)
    
    private let titleLabel = UILabel(text: Constants.LiveBadgeView.title, textColor: .white, font: UIFont.boldSystemFont(ofSize: 8))
    
    private let liveIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Constants.LiveBadgeView.icon))
        imageView.layer.zPosition = 3
        imageView.tintColor = .white
        imageView.constrainWidth(constant: 14)
        imageView.constrainHeight(constant: 12)
        return imageView
    }()
    
    private lazy var  backgroundContainer: UIView = {
      let view = UIView()
        view.backgroundColor = .systemRed
        [titleLabel,liveIcon].forEach{
            view.addSubview($0)
            $0.centerInSuperview()
        }
        titleLabel.isHidden = true
        view.constrainWidth(constant: 30)
        view.constrainHeight(constant: 15)
        view.layer.cornerRadius = 3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundContainer)
        backgroundContainer.fillSuperview()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

