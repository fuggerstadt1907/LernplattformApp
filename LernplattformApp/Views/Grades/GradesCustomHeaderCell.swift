//
//  GradesCustomHeaderCell.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 19.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class GradesCustomHeaderCell: UITableViewHeaderFooterView {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    var toggleDelegate: GradesCustomHeaderCellDelegate?
    
    let toggleDropdownButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "arrow_up")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(toggleGradesDropdownButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    let moduleTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Databases und Development"
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let moduleTitleId: UILabel = {
        let lbl = UILabel()
        lbl.text = "(MTI101)"
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        return lbl
    }()
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundView = UIView()
        self.backgroundView!.backgroundColor = Colors.AppLightBlue
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(toggleDropdownButton)
        addSubview(moduleTitleLabel)
        addSubview(moduleTitleId)
        
        toggleDropdownButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 23, height: 0)
        
        moduleTitleLabel.anchor(top: topAnchor, left: toggleDropdownButton.rightAnchor, bottom: nil, right: nil, paddingTop: 11, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 250, height: 0)
        
        moduleTitleId.anchor(top: moduleTitleLabel.bottomAnchor, left: toggleDropdownButton.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 11, paddingRight: 0, width: 250, height: 0)
    }
    
    @objc fileprivate func toggleGradesDropdownButtonTapped() {
        toggleDelegate?.toggleModule(button: toggleDropdownButton)
    }
}
