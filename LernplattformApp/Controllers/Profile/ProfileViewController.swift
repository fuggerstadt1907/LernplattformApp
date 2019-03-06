//
//  ProfileViewController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 04.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class ProfileViewController: BaseListController {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        navigationItem.title = "My Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutBarButtonItemTapped))
    }
    
    
    // ---------------
    // MARK: - CollectionView Functions
    // ---------------
    
    
    
    // ---------------
    // MARK: - OBJC Functions
    // ---------------
    @objc fileprivate func LogoutBarButtonItemTapped() {
        print("Logout handeling.....")
    }
}
