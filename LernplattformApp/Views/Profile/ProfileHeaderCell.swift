//
//  ProfileHeaderCell.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UICollectionViewCell {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    var greenView: UIView = {
        let v = UIView()
        return v
    }()
    
    var gradientLayer: CAGradientLayer!
    
    var apprenticeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "img_placeholder").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        return iv
    }()
    
    var testview: UIView = {
        let v = UIView()
        return v
    }()
    
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.AppDarkBlue
        setupHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupHeader() {
        addSubview(apprenticeImageView)
        let width = frame.width / 2.5
        let imageCornerRadius = width/2
        apprenticeImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width, height: width)
        apprenticeImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        apprenticeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        apprenticeImageView.layer.cornerRadius = imageCornerRadius

    }
}
