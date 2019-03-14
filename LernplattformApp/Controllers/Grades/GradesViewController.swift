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
    let gradesConfirmInfoIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "info_icon").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        iv.heightAnchor.constraint(equalToConstant: 24)
        iv.widthAnchor.constraint(equalToConstant: 24)
        iv.clipsToBounds = true
        return iv
    }()
    
    var gradesToBeConfirmedCount: Int = 0
    
    let gradesConfirmInfoText: UILabel = {
        let l = UILabel()
        l.text = "Grades to be confirmed: 0"
        l.font = .boldSystemFont(ofSize: 18)
        l.numberOfLines = 0
        l.adjustsFontSizeToFitWidth = true
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
        let gradesConfirmStackView = UIStackView(arrangedSubviews: [gradesConfirmInfoIcon, gradesConfirmInfoText])
        gradesConfirmStackView.axis = .horizontal
        gradesConfirmStackView.spacing = 10
        gradesConfirmStackView.distribution = .fillProportionally
        gradesConfirmStackView.alignment = .center
        collectionView.addSubview(gradesConfirmStackView)
        gradesConfirmStackView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 30, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 0)
        
    }
    
    
    // ---------------
    // MARK: - Fetching API Data
    // ---------------
    
    
    
    // ---------------
    // MARK: - CollectionView Functions
    // ---------------
    
    
}
