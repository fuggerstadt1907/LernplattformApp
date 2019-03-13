//
//  VerticalStackView.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 11.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//


import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
        self.distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
