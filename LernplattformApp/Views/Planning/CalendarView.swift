//
//  CalendarView.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 05.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit
import CVCalendar


class CalendarView: BaseListController {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    var calendarDelegate: CustomCalendarViewDelegate?
    fileprivate let cellID = "cellId"
    
    fileprivate var calendarContainerView: UIView = {
        let ccv = UIView()
        return ccv
    }()
    
    fileprivate var menuView: CVCalendarMenuView = {
        let mv = CVCalendarMenuView()
        mv.dayOfWeekTextUppercase = true
        return mv
    }()
    
    fileprivate var calendarView: CVCalendarView = {
        let cv = CVCalendarView()
        return cv
    }()
    
    fileprivate let redView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        return v
    }()
    
    fileprivate let blueView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        return v
    }()
    
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        setupCalendarView()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }
}

extension CalendarView: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    
    fileprivate func setupCalendarView() {
        self.calendarView.calendarAppearanceDelegate = self
        self.calendarView.animatorDelegate = self
        self.menuView.menuViewDelegate = self
        self.calendarView.calendarDelegate = self

        collectionView.addSubview(calendarContainerView)
        calendarContainerView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: collectionView.frame.width, height: 300)
        
        calendarContainerView.addSubview(menuView)
        calendarContainerView.addSubview(calendarView)
        menuView.anchor(top: calendarContainerView.topAnchor, left: calendarContainerView.leftAnchor, bottom: nil, right: calendarContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 15)
        calendarView.anchor(top: menuView.bottomAnchor, left: calendarContainerView.leftAnchor, bottom: calendarContainerView.bottomAnchor, right: calendarContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 285)

        calendarView.appearance.dayLabelWeekdaySelectedBackgroundColor = Colors.AppDarkBlue
        calendarView.appearance.dayLabelPresentWeekdaySelectedBackgroundColor = Colors.AppDarkBlue
        calendarView.appearance.dayLabelPresentWeekdayTextColor = Colors.AppOrange
    }
    
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    func firstWeekday() -> Weekday {
        return .monday
    }
    
    func didShowNextMonthView(_ date: Date) {
        let newDate = CVDate(date: date, calendar: Calendar(identifier: .gregorian))
        calendarDelegate?.changeNavigationTitle(to: newDate.globalDescription)
    }
    
    func didShowPreviousMonthView(_ date: Date) {
        let newDate = CVDate(date: date, calendar: Calendar(identifier: .gregorian))
        calendarDelegate?.changeNavigationTitle(to: newDate.globalDescription)
    }
    
    fileprivate func changeNavigationItemTitle(to Title: String) {
        let planningViewController = PlanningViewController()
        planningViewController.navigationItem.title = Title
    }
}


extension CalendarView: PlanningViewControllerDelegate {
    func toggleToCurrentDay() {
        calendarView.toggleCurrentDayView()        
    }
    
    func setNavigationTitleToCurrentDay() {
        print("test...121212121212")
        let currentDay = calendarView.presentedDate.globalDescription
        calendarDelegate?.changeNavigationTitle(to: currentDay)
    }
    
    
}
