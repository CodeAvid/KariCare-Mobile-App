//
//  ActiveUserCell.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import UIKit


class StoryCell: UICollectionViewCell, ComponentsShimmers{
    
    private let liveBadgeView = LiveBadgeView()
    
    var animationDuration: Double = 0.25
    let cornerRadius: CGFloat = 18
    
    var shimmer: ShimmerLayer = ShimmerLayer()
    
    private lazy var storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
   
    
    private lazy var userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.constrainWidth(constant: 36)
        imageView.constrainHeight(constant: 36)
        imageView.layer.cornerRadius = cornerRadius
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
    
    // MARK:- delegate functions for collectionView
    func hideViews() {
        ViewAnimationFactory.makeEaseOutAnimation(duration: animationDuration, delay: 0) {
            self.storyImageView.setOpacity(to: 0)
            self.userProfileImageView.setOpacity(to: 0)
            self.usernameLabel.setOpacity(to: 0)
        }
    }
    
    func showViews() {
        self.storyImageView.setOpacity(to: 1)
        self.userProfileImageView.setOpacity(to: 1)
        self.usernameLabel.setOpacity(to: 10)
    }
    
    func setShimmer() {
        DispatchQueue.main.async { [unowned self] in
            self.shimmer.removeFromSuperlayer()
            self.shimmer = ShimmerLayer(for: self.storyImageView, cornerRadius: self.cornerRadius)
            self.layer.addSublayer(self.shimmer)
        }
    }
    
    func removeShimmer() {
        shimmer.removeFromSuperlayer()
    }
    
    func configureCell(with user: Photo){
        if let storyImage = user.urls?.small, let profileImageUrl =  user.user?.profileImage?.medium, let lastName = user.user?.lastName, let firstName = user.user?.firstName{
            storyImageView.sd_setImage(with: URL(string: storyImage))
            userProfileImageView.sd_setImage(with: URL(string: profileImageUrl))
            usernameLabel.text = "\(firstName) \(lastName)"
            usernameLabel.backgroundColor = .clear
        }
    }
}
