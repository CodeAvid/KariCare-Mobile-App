//
//  ProfileHeaderView.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView {
    
    static var reuseIdentifier = String(describing: ProfileHeaderView.self)

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
    private let titleLabel = UILabel(text: Constants.ProfileVc.title, textColor: .label, font: UIFont.preferredFont(forTextStyle: .headline))
    
    

    private let nameLabel = UILabel(text: Constants.ProfileVc.name, textColor: .label, font: UIFont.preferredFont(forTextStyle: .headline))
    
    private let locationLabel = UILabel(text: Constants.ProfileVc.location, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body))
    
    private let photoTitleLabel = UILabel(text: Constants.ProfileVc.photoCaption, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body), textAlignment: .center)
    
    private let photoCountLabel = UILabel(text: Constants.ProfileVc.defaulttotalPhotos, textColor: .label, font: UIFont.boldSystemFont(ofSize: 20), textAlignment: .center)
    
    private let followerTitleLabel = UILabel(text: Constants.ProfileVc.followersCaption, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body), textAlignment: .center)
    
    private let followerCountLabel = UILabel(text: Constants.ProfileVc.defaultNumberOfFollowers, textColor: .label, font: UIFont.boldSystemFont(ofSize: 20), textAlignment: .center)
    
    private let followingTitleLabel = UILabel(text: Constants.ProfileVc.followingCaption, textColor: .label, font: UIFont.preferredFont(forTextStyle: .body), textAlignment: .center)
    
    private let followingCountLabel = UILabel(text: Constants.ProfileVc.defaultNumberOfPeopleFollowing, textColor: .label, font: UIFont.boldSystemFont(ofSize: 20), textAlignment: .center)
    
    //Private StackViews
    
    private lazy var infoStackView = VerticalStackView(arrangedSubviews: [profileImage, nameLabel, locationLabel], spacing: 10)
    
    private lazy var photoStackView = VerticalStackView(arrangedSubviews: [photoTitleLabel, photoCountLabel])
    
    private lazy var followerStackView = VerticalStackView(arrangedSubviews: [followerTitleLabel, followerCountLabel])
    
    private lazy var followingStackView = VerticalStackView(arrangedSubviews: [followingTitleLabel, followingCountLabel])
    
    private lazy var accountStackView: UIStackView = {
        let stackview = HorizontalStackView(arrangedSubviews: [photoStackView,followerStackView, followingStackView], spacing: 20)
        stackview.alignment = .center
        stackview.distribution = .fillEqually
        return stackview
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        infoStackView.alignment = .center
        
        let contentContainer = VerticalStackView(arrangedSubviews: [infoStackView, accountStackView], spacing: 20)
        contentContainer.alignment = .center
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


