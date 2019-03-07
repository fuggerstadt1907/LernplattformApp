//
//  ProfileHeader.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    let profileHeaderController = ProfileHeaderController()
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileHeaderController.view)
        profileHeaderController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
