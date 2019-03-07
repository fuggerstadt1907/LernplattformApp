//
//  ProfileHeaderController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class ProfileHeaderController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    fileprivate let cellId = "cellId"
    
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    // ---------------
    // MARK: - CollectionView Functions
    // ---------------
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfileHeaderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
