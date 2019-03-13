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
    // Mvar: - Declarations
    // ---------------
    fileprivate let profileHeaderCellId = "profileHeaderCellId"
    fileprivate let profileDataCellId = "profileDataCellId"
    fileprivate var apprentice: ApprenticeResult?
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        collectionView.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: profileHeaderCellId)
        collectionView.register(ProfileDataCell.self, forCellWithReuseIdentifier: profileDataCellId)
        setupNavigationBar()
        fetchApiData()
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = "My Profile"
        let rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutBarButtonItemTapped))
        rightBarButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    // ---------------
    // MARK: - Fetching API Data
    // ---------------
    fileprivate func fetchApiData() {
        Service.shared.fetchApprenticePersonalData { (res, err) in
            if let err = err {
                print("⚠️ Failed to fetch API Data:\n", err)
                return
            }
            guard let result = res?.result else  {
                print("⚠️ Error with Apprentice API Result")
                return
            }
            self.apprentice = result
            print("✅ Fetched Apprentice: ", result.name.first, result.name.last)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
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
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: collectionView.frame.height * 0.3)
        }
        else {
            return CGSize(width: view.frame.width, height: collectionView.frame.height * 0.7)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileHeaderCellId, for: indexPath) as! ProfileHeaderCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileDataCellId, for: indexPath) as! ProfileDataCell
            let apprenticeResult = self.apprentice
            cell.apprenticeName.text = "\(apprenticeResult?.name.first ?? "n/a") \(apprenticeResult?.name.last ?? "n/a")"
            cell.apprenticeJob.text = apprenticeResult?.job ?? "n/a"
            cell.apprenticeGroup.text = apprenticeResult?.group ?? "n/a"
            cell.apprenticeTrainingscenter.text = apprenticeResult?.trainingscenter ?? "n/a"
            cell.apprenticeEmail.text = "contact@ao-app.dev"
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
