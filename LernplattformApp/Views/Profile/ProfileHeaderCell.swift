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
    var greenView: UIView!
    var gradientLayer: CAGradientLayer!
    
    var apprenticeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
//        iv.heightAnchor.constraint(equalToConstant: 145).isActive = true
//        iv.widthAnchor.constraint(equalToConstant: 145).isActive = true
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 3
        return iv
    }()
    
    var testview: UIView = {
        let v = UIView()
//        v.backgroundColor = .red
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
        greenView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 300))
        addSubview(greenView)
        greenView.fillSuperview()
        //greenView.anchor(top: nil, left: safeAreaLayoutGuide.leftAnchor, bottom: bottomAnchor, right: safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: (frame.size.height * 0.55))
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = greenView.bounds
        gradientLayer.colors = [Colors.AppDarkBlue.cgColor, Colors.AppLightBlue.cgColor]
        greenView.layer.addSublayer(gradientLayer)
        greenView.addSubview(apprenticeImageView)
        apprenticeImageView.anchor(top: greenView.topAnchor, left: greenView.leftAnchor, bottom: nil, right: greenView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 300)
        apprenticeImageView.layer.cornerRadius = 300/2
        apprenticeImageView.centerXAnchor.constraint(equalTo: greenView.centerXAnchor).isActive = true
        
//        let myLayer = CALayer()
//        let myImage = UIImage(named: "star")?.cgImage
//        myLayer.frame = myView.bounds
//        myLayer.contents = myImage
//        myView.layer.addSublayer(myLayer)
        
//        greenView.addSubview(apprenticeImageView)
//        apprenticeImageView.anchor(top: greenView.topAnchor, left: greenView.leftAnchor, bottom: greenView.bottomAnchor, right: greenView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
//        apprenticeImageView.centerXAnchor.constraint(equalTo: greenView.centerXAnchor).isActive = true
//        apprenticeImageView.centerYAnchor.constraint(equalTo: greenView.centerYAnchor).isActive = true
    }
}
