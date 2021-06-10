//
//  ProfileHeaderView.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView {
    
    static var reuseIdentifier = String(describing: ProfileHeaderView.self)
    
    private var backButton: UIButton = {
        let button = UIButton()
        let imageView = UIImageView(image: UIImage(systemName: Constants.ProfileVc.backIcon))
        button.setImage(imageView.image, for: .normal)
        button.tintColor = UIColor(named: Constants.Colors.darkGrayColor)
        return button
    }()
    
    private var moreBtn: UIButton{
        let button = UIButton()
        let imageView = UIImageView(image: UIImage(systemName: Constants.HomeVC.more))
        button.setImage(imageView.image?.rotate(radians: .pi / 2), for: .normal)
        button.tintColor = UIColor(named: Constants.Colors.darkGrayColor)
        return button
    }

    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image  = UIImage(named: Constants.Images.profileImage)
        imageView.contentMode = .scaleAspectFill
        imageView.constrainHeight(constant: 120)
        imageView.constrainWidth(constant: 120)
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 5.0
        imageView.layer.borderColor = UIColor.systemGray6.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    //Private Labels
    private let titleLabel = UILabel(text: Constants.ProfileVc.title, textColor: UIColor(named: Constants.Colors.darkGrayColor)!, font: UIFont.boldSystemFont(ofSize: 30))
    
    

    private let nameLabel = UILabel(text: Constants.ProfileVc.name, textColor:  UIColor(named: Constants.Colors.darkGrayColor) ?? .darkGray, font: UIFont.boldSystemFont(ofSize: 25))
    
    private let locationLabel = UILabel(text: Constants.ProfileVc.location, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body))
    
    private let photoTitleLabel = UILabel(text: Constants.ProfileVc.photoCaption, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body), textAlignment: .center)
    
    private let photoCountLabel = UILabel(text: Constants.ProfileVc.defaulttotalPhotos, textColor:  UIColor(named: Constants.Colors.darkGrayColor) ?? .darkGray, font: UIFont.boldSystemFont(ofSize: 25), textAlignment: .center)
    
    private let followerTitleLabel = UILabel(text: Constants.ProfileVc.followersCaption, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body), textAlignment: .center)
    
    private let followerCountLabel = UILabel(text: Constants.ProfileVc.defaultNumberOfFollowers, textColor:  UIColor(named: Constants.Colors.darkGrayColor) ?? .darkGray, font: UIFont.boldSystemFont(ofSize: 25), textAlignment: .center)
    
    private let followingTitleLabel = UILabel(text: Constants.ProfileVc.followingCaption, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body), textAlignment: .center)
    
    private let followingCountLabel = UILabel(text: Constants.ProfileVc.defaultNumberOfPeopleFollowing, textColor: UIColor(named: Constants.Colors.darkGrayColor) ?? .darkGray, font: UIFont.boldSystemFont(ofSize: 25), textAlignment: .center)
    
    //Private StackViews
    private lazy var backStackView = HorizontalStackView(arrangedSubviews: [backButton, UIView(), moreBtn])
    private lazy var infoStackView = VerticalStackView(arrangedSubviews: [profileImage, nameLabel, locationLabel], spacing: 10)
    
    private lazy var myProfileStackView = VerticalStackView(arrangedSubviews: [backStackView ,titleLabel, infoStackView], spacing: 20)
    
    private lazy var photoStackView = VerticalStackView(arrangedSubviews: [photoTitleLabel, photoCountLabel])
    
    private lazy var followerStackView = VerticalStackView(arrangedSubviews: [followerTitleLabel, followerCountLabel])
    
    private lazy var followingStackView = VerticalStackView(arrangedSubviews: [followingTitleLabel, followingCountLabel])
    
    private lazy var accountStackView: UIStackView = {
        let stackView = HorizontalStackView(arrangedSubviews: [photoStackView,followerStackView, followingStackView], spacing: 20)
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backStackView.alignment = .fill
        infoStackView.alignment = .center
        
        let contentContainer = VerticalStackView(arrangedSubviews: [myProfileStackView, accountStackView], spacing: 20)
        contentContainer.alignment = .fill
        addSubview(contentContainer)
        contentContainer.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    func update(totalPhotos count: Int){
        photoCountLabel.text = String(count)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


