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
    //var greenView: UIView!
    var greenView: UIView = {
        let v = UIView()
        return v
    }()
    
    var gradientLayer: CAGradientLayer!
    
    var apprenticeImageView: UIImageView = {
        let iv = UIImageView()
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
        setupGradientLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupGradientLayer() {
        greenView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        addSubview(greenView)
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = greenView.bounds
        gradientLayer.colors = [Colors.AppDarkBlue.cgColor, Colors.AppLightBlue.cgColor]
        greenView.layer.addSublayer(gradientLayer)
    }
}
