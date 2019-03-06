//
//  CalendarTableViewCell.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    //---------
    // MARK: - Declarations
    //---------
    var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 11, weight: .regular)
        lbl.textColor = .lightGray
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var subjectLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.lineBreakMode = .byTruncatingTail
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var roomLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 11, weight: .regular)
        lbl.textColor = .lightGray
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    
    //---------
    // MARK: - Setting up the view
    //---------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(timeLabel)
        addSubview(subjectLabel)
        addSubview(roomLabel)
        
        timeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 50, height: 0)
        subjectLabel.anchor(top: topAnchor, left: timeLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 6, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: frame.width*0.8, height: 0)
        roomLabel.anchor(top: subjectLabel.bottomAnchor, left: subjectLabel.leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 6, paddingRight: 0, width: frame.width*0.8, height: 0)
    }
    
}
