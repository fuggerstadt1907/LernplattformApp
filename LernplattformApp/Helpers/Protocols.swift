//
//  Protocols.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 12.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import Foundation
import CVCalendar


protocol CustomCalendarViewDelegate {
    func changeNavigationTitle(to Title: String)
}

protocol PlanningViewControllerDelegate {
    func toggleToCurrentDay()
    func setNavigationTitleToCurrentDay()
}

protocol GradesCustomHeaderCellDelegate {
    func toggleModule(button: UIButton)
}
