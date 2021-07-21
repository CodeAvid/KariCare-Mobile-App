//
//  PhotoCell.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import UIKit
import SDWebImage


class PhotoCell: UICollectionViewCell {
    
    let profileImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.backgroundColor = UIColor.systemGray5
        profileImage.layer.cornerRadius = 10
        addSubview(profileImage)
        profileImage.fillSuperview()
    }
    
    
    var photo: Photo? {
      didSet {
          if let imageUrl = photo?.urls?.small{
              profileImage.sd_setImage(with: URL(string: imageUrl))
          }
      }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
