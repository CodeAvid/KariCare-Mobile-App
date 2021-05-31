//
//  FeedCell.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import UIKit
import SDWebImage

class FeedCell: UICollectionViewCell{
    
    
    private var userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.constrainWidth(constant: 50)
        imageView.constrainHeight(constant: 50)
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var usernameLabel = UILabel(text: "", textColor: .label, font: UIFont.boldSystemFont(ofSize: 18), numberOfLines: 2)
    
    private var locationLabel = UILabel(text: "", textColor: .label, font: UIFont.preferredFont(forTextStyle: .caption1), numberOfLines: 1)
    
    private var moreBtn: UIButton{
        let button = UIButton()
        let imageView = UIImageView(image: UIImage(systemName: Constants.HomeVC.more))
        imageView.tintColor = UIColor().hexStringToUIColor(hex: Constants.Colors.greyColor)
        button.setImage(imageView.image?.rotate(radians: .pi / 2), for: .normal)
        return button
    }
    
    private var bookmarkBtn: UIButton{
        let button = UIButton()
        let image = UIImage(systemName: Constants.HomeVC.bookmark)
        button.setImage(image, for: .normal)
        button.setImage(image?.withTintColor(.white), for: .selected)
        button.layer.zPosition = 10
        return button
    }
    
    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
   
    private lazy var labelStackView = VerticalStackView(arrangedSubviews: [usernameLabel, locationLabel], spacing: 5)
    
    private lazy var topStackView = HorizontalStackView(arrangedSubviews: [userProfileImageView, labelStackView, UIView(), moreBtn], spacing: 10)
    
    let iconColor: UIColor = .init(named: Constants.Colors.greyColor) ?? .gray
    
    private lazy var likeLabel = UILabel(text: "", textColor: iconColor, font: .boldSystemFont(ofSize: 14))
    private lazy var commentLabel = UILabel(text: "", textColor: iconColor, font: .boldSystemFont(ofSize: 14))
    private lazy var replyLabel = UILabel(text: "", textColor: iconColor, font: .boldSystemFont(ofSize: 14))
    
    private lazy var likeIcon: UIButton = {
        let icon = UIButton()
        let image = UIImage(systemName: Constants.HomeVC.likes)
        icon.tintColor = iconColor
        icon.setImage(image, for: .normal)
        return icon
    }()
    
    private lazy var commentIcon: UIButton = {
        let icon = UIButton()
        let image = UIImage(systemName: Constants.HomeVC.comment)
        icon.tintColor = iconColor
        icon.setImage(image, for: .normal)
        return icon
    }()
    
    private lazy var replyIcon: UIButton = {
        let icon = UIButton()
        let image = UIImage(systemName: Constants.HomeVC.reply)
        icon.tintColor = iconColor
        icon.setImage(image, for: .normal)
        return icon
    }()
    
    private lazy var likeStackView = HorizontalStackView(arrangedSubviews: [likeIcon, likeLabel], spacing: 10)
    private lazy var commentStackView = HorizontalStackView(arrangedSubviews: [commentIcon, commentLabel], spacing: 10)
    private lazy var replyStackView = HorizontalStackView(arrangedSubviews: [replyIcon, replyLabel], spacing: 10)
    
    private lazy var bottomStackView = HorizontalStackView(arrangedSubviews: [likeStackView, commentStackView, replyStackView, UIView()], spacing: 20)
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [usernameLabel, locationLabel].forEach{
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 5
        }
        let contentStackView = VerticalStackView(arrangedSubviews: [topStackView, postImageView, bottomStackView], spacing:20)
        addSubview(contentStackView)
        contentStackView.fillSuperview()
    }
    
    
    
    func configureCell(with feed: Photo){
        if let profileImageUrl = feed.user?.profileImage?.medium, let   firstName  = feed.user?.firstName, let lastName = feed.user?.lastName, let location = feed.user?.location, let feedURl = feed.urls?.full, let likes = feed.likes, let comments = feed.user?.totalLikes, let reply = feed.user?.totalCollections {
            userProfileImageView.sd_setImage(with: URL(string: profileImageUrl))
            usernameLabel.text = "\(firstName) \(lastName)"
            locationLabel.text = location
            postImageView.sd_setImage(with: URL(string: feedURl))
            likeLabel.text  = String(likes)
            commentLabel.text = String(comments)
            replyLabel.text = String(reply)
            cleaclearBackground()
        }
    }
    
    private func cleaclearBackground(){
        [usernameLabel, locationLabel].forEach{
            $0.backgroundColor = .clear
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

   
    
}
