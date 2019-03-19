//
//  FinalGradeCell.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 19.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class FinalGradeCell: UITableViewCell {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    let educationIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "education").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let finalGradeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Final grade"
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lbl.textColor = .white
        return lbl
    }()
    
    let gradesInPoints: UILabel = {
        let lbl = UILabel()
        lbl.text = "82"
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lbl.textColor = .white
        return lbl
    }()
    
    let gradesInDecimal: UILabel = {
        let lbl = UILabel()
        lbl.text = "(2,3)"
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lbl.textColor = .white
        return lbl
    }()

    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(educationIcon)
        addSubview(finalGradeLabel)
        addSubview(gradesInPoints)
        addSubview(gradesInDecimal)
        
        educationIcon.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 0, height: 0)
        
        finalGradeLabel.anchor(top: topAnchor, left: educationIcon.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 100, height: 0)
        
        gradesInDecimal.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 20, paddingRight: 20, width: 50, height: 0)
        
        gradesInPoints.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: gradesInDecimal.leftAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 30, height: 0)
    }
    
}
