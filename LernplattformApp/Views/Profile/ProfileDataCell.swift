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
    let nameLabel = UILabel(firstLineString: "Name", secondLineString: "Alessandro Orlandi")
    let jobLabel = UILabel(firstLineString: "Job", secondLineString: "Master of Desaster :-)")
    let groupLabel = UILabel(firstLineString: "Group", secondLineString: "What ever you like")
    let trainingscenterLabel = UILabel(firstLineString: "Trainingscenter", secondLineString: "SPE Test")
    let emailLabel = UILabel(firstLineString: "E-Mail", secondLineString: "contact@ao-app.dev")
    let owaButton = UIButton(title: "OWA Mail")
    let ebisButton = UIButton(title: "ebis Portal")
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let stackView = VerticalStackView(arrangedSubviews: [nameLabel, jobLabel, groupLabel,trainingscenterLabel, emailLabel], spacing: 15)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)
        
        let buttonStackView = UIStackView(arrangedSubviews: [owaButton, ebisButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 25
        buttonStackView.distribution = .fillEqually
        addSubview(buttonStackView)
        buttonStackView.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 35, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 45)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
