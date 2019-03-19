//
//  ModuleGradeCell.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 19.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class ModuleGradeCell: UITableViewCell {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    
    
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
        
    }
    
}
