//
//  ActiveUserCell.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import UIKit


class StoryCell: UICollectionViewCell{
    
    private let liveBadgeView = LiveBagdeView()
    
    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
   
    
    private var userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.constrainWidth(constant: 36)
        imageView.constrainHeight(constant: 36)
        imageView.layer.cornerRadius = 18
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = (UIColor(named: Constants.Colors.peachColor) ?? .systemPink).cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private var usernameLabel = UILabel(text: "", textColor: .label, font: UIFont.preferredFont(forTextStyle: .caption1), numberOfLines: 2)
    
    private lazy var bottomStackView: UIStackView = HorizontalStackView(arrangedSubviews: [userProfileImageView, usernameLabel], spacing: 10)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let contentStackView = VerticalStackView(arrangedSubviews: [storyImageView, bottomStackView], spacing: 10)
        addSubview(contentStackView)
        contentStackView.fillSuperview()
        liveBadgeView.layer.zPosition = 10
        storyImageView.addSubview(liveBadgeView)
        liveBadgeView.anchor(top: storyImageView.topAnchor, trailing: storyImageView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 0, right: 5))
        
        [usernameLabel].forEach{
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 5
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with user: Photo){
        if let storyImage = user.urls?.full, let profileImageUrl =  user.user?.profileImage?.medium, let lastName = user.user?.lastName, let firstName = user.user?.firstName{
            storyImageView.sd_setImage(with: URL(string: storyImage))
            userProfileImageView.sd_setImage(with: URL(string: profileImageUrl))
            usernameLabel.text = "\(firstName) \(lastName)"
            usernameLabel.backgroundColor = .clear
        }

    }
}
