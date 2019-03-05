//
//  PlanningViewController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 04.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit
import CVCalendar

class PlanningViewController: BaseListController {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    fileprivate var monthViewActive: Bool = true
    fileprivate var menuView: CVCalendarMenuView = {
        let mv = CVCalendarMenuView()
        mv.dayOfWeekTextUppercase = true
        return mv
    }()
    
    fileprivate var calendarView: CVCalendarView = {
        let cv = CVCalendarView()
        return cv
    }()
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        setupNavigationBar()
        setupCVCalender()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
        
    }
    
    fileprivate func setupNavigationBar() {
        let month = CVDate(date: Date(), calendar: Calendar(identifier: .gregorian))
        navigationItem.title = month.globalDescription
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(TodayBarButtonItemTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    fileprivate func setupCVCalender() {
        self.calendarView.calendarAppearanceDelegate = self
        self.calendarView.animatorDelegate = self
        self.menuView.menuViewDelegate = self
        self.calendarView.calendarDelegate = self
        
        collectionView.addSubview(menuView)
        menuView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 15)
        
        collectionView.addSubview(calendarView)
        calendarView.anchor(top: menuView.bottomAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 400)
    }
    
    func firstWeekday() -> Weekday {
        return .monday
    }
    
    func didShowNextMonthView(_ date: Date) {
        let newDate = CVDate(date: date, calendar: Calendar(identifier: .gregorian))
        changeNavigationItemTitle(to: newDate.globalDescription)
    }
    
    func didShowPreviousMonthView(_ date: Date) {
        let newDate = CVDate(date: date, calendar: Calendar(identifier: .gregorian))
        changeNavigationItemTitle(to: newDate.globalDescription)
    }
    
    fileprivate func changeNavigationItemTitle(to Title: String) {
        navigationItem.title = Title
    }
    
    
    
    
    // ---------------
    // MARK: - CollectionView Functions
    // ---------------
    
    
    
    
    // ---------------
    // MARK: - OBJC Functions
    // ---------------
    @objc fileprivate func TodayBarButtonItemTapped() {
        calendarView.toggleCurrentDayView()
        navigationItem.title = calendarView.presentedDate.globalDescription
    }
    
}

extension PlanningViewController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
}
