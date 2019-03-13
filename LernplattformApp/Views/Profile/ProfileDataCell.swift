//
//  ProfileDataCell.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class ProfileDataCell: UICollectionViewCell {
   
    // ---------------
    // MARK: - Declarations
    // ---------------
    fileprivate let nameLabel = UILabel(labelString: "Name")
    var apprenticeName = UILabel(attributedString: "")
    fileprivate let jobLabel = UILabel(labelString: "Job")
    var apprenticeJob = UILabel(attributedString: "")
    fileprivate let groupLabel = UILabel(labelString: "Group")
    var apprenticeGroup = UILabel(attributedString: "")
    fileprivate let trainingscenterLabel = UILabel(labelString: "Trainingscenter")
    var apprenticeTrainingscenter = UILabel(attributedString: "")
    fileprivate let emailLabel = UILabel(labelString: "E-Mail")
    var apprenticeEmail = UILabel(attributedString: "")
    let owaButton = UIButton(title: "OWA Mail")
    let ebisButton = UIButton(title: "ebis Portal")

    
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let nameStackView = VerticalStackView(arrangedSubviews: [nameLabel, apprenticeName], spacing: 5)
        let jobStackView = VerticalStackView(arrangedSubviews: [jobLabel, apprenticeJob], spacing: 5)
        let groupStackView = VerticalStackView(arrangedSubviews: [groupLabel, apprenticeGroup], spacing: 5)
        let tcStackView = VerticalStackView(arrangedSubviews: [trainingscenterLabel, apprenticeTrainingscenter], spacing: 5)
        let emailStackView = VerticalStackView(arrangedSubviews: [emailLabel, apprenticeEmail], spacing: 5)
        
        let overallStackView = BulkVerticalStackViews(arrangedStackViews: [nameStackView, jobStackView, groupStackView, tcStackView, emailStackView], spacing: 25)
        
        addSubview(overallStackView)
        overallStackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let buttonStackView = UIStackView(arrangedSubviews: [owaButton, ebisButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        addSubview(buttonStackView)
        buttonStackView.anchor(top: overallStackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 35, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
