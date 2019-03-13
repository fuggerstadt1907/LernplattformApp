//
//  ProfileViewController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 04.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class ProfileViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    fileprivate let profileHeaderCellId = "profileHeaderCellId"
    fileprivate let profileDataCellId = "profileDataCellId"
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        collectionView.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: profileHeaderCellId)
        collectionView.register(ProfileDataCell.self, forCellWithReuseIdentifier: profileDataCellId)
        setupNavigationBar()
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = "My Profile"
        let rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutBarButtonItemTapped))
        rightBarButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    
    
    // ---------------
    // MARK: - CollectionView Functions
    // ---------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height / 2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileHeaderCellId, for: indexPath) as! ProfileHeaderCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileDataCellId, for: indexPath) as! ProfileDataCell
            return cell
        }
    }
    
    
    
    // ---------------
    // MARK: - OBJC Functions
    // ---------------
    @objc fileprivate func LogoutBarButtonItemTapped() {
        print("Logout handeling.....")
    }
}
