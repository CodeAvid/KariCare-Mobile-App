//
//  LoadingCell.swift
//  kariCare-ios
//
//  Created by Benjamin Akhigbe on 07/07/2021.
//

import Foundation
import UIKit

class loadingCell: UICollectionViewCell{
    
    static let reuseID = String(describing: self)
    
    var activityIndicator: UIActivityIndicatorView!

    
    init(activityIndicator: UIActivityIndicatorView) {
        self.activityIndicator = activityIndicator
       super.init(frame: .zero)
        self.setupSubviews()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .medium
        indicator.color = .gray
        indicator.hidesWhenStopped = true

        contentView.addSubview(indicator)

        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            indicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])

        indicator.startAnimating()
    }
}
