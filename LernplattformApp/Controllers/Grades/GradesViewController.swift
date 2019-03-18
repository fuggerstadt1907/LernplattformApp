//
//  GradesViewController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 04.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class GradesViewController: BaseListController {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    var gradesToBeConfirmedCount: Int = 0
    
    let gradesConfirmInfoText: UILabel = {
        let l = UILabel()
        l.text = "Grades to be confirmed:"
        l.font = .boldSystemFont(ofSize: 18)
        l.numberOfLines = 0
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .center
        return l
    }()
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "My Grades"
        setupConfirmGradesUI()
    }
    
    fileprivate func setupConfirmGradesUI() {
        collectionView.addSubview(gradesConfirmInfoText)
        gradesConfirmInfoText.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 30)
        gradesConfirmInfoText.text = "\(gradesConfirmInfoText.text!) \(gradesToBeConfirmedCount)"
    }
    
    
    // ---------------
    // MARK: - Fetching API Data
    // ---------------
    
    
    
    // ---------------
    // MARK: - CollectionView Functions
    // ---------------
    
    
}
