//
//  StackView+Extension.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//
import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .center) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class HorizontalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .center) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .horizontal
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
