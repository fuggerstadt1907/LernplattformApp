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
    fileprivate let cellId = "cellId"
    
    fileprivate var topContainerView: UIView = {
        let cv = UIView()
        cv.clipsToBounds = true
        return cv
    }()
    
    fileprivate var bottomContainerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .green
        cv.clipsToBounds = true
        return cv
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
    
    fileprivate var tableView: UITableView = {
        let tv = UITableView()
        tv.clipsToBounds = true
        return tv
    }()
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
    
        setupNavigationBar()
        setupCVCalender()
        setupTableView()
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
    
    
    
    // ---------------
    // MARK: - TableView Functions
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
    
    fileprivate func setupCVCalender() {
        collectionView.addSubview(topContainerView)
        let topContainerHeight = collectionView.frame.height*0.4
        topContainerView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: collectionView.frame.width, height: topContainerHeight)
        
        topContainerView.addSubview(menuView)
        topContainerView.addSubview(calendarView)
        
        self.calendarView.calendarAppearanceDelegate = self
        self.calendarView.animatorDelegate = self
        self.menuView.menuViewDelegate = self
        self.calendarView.calendarDelegate = self
        
        collectionView.addSubview(menuView)
        menuView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 15)
        
        collectionView.addSubview(calendarView)
        calendarView.anchor(top: menuView.bottomAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: (topContainerHeight))
        
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
        changeNavigationItemTitle(to: newDate.globalDescription)
    }
    
    func didShowPreviousMonthView(_ date: Date) {
        let newDate = CVDate(date: date, calendar: Calendar(identifier: .gregorian))
        changeNavigationItemTitle(to: newDate.globalDescription)
    }
    
    fileprivate func changeNavigationItemTitle(to Title: String) {
        navigationItem.title = Title
    }
    
}


extension PlanningViewController: UITableViewDelegate, UITableViewDataSource {
    
    fileprivate func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: cellId)
        
        collectionView.addSubview(bottomContainerView)
        bottomContainerView.anchor(top: topContainerView.bottomAnchor, left: collectionView.leftAnchor, bottom: collectionView.bottomAnchor, right: collectionView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        bottomContainerView.addSubview(tableView)
        tableView.anchor(top: bottomContainerView.topAnchor, left: bottomContainerView.leftAnchor, bottom: bottomContainerView.bottomAnchor, right: bottomContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CalendarTableViewCell
        cell.timeLabel.text = "13:00 \n16:00"
        cell.subjectLabel.text = "Algorithmen und Datenstrukturen"
        cell.tintColor = Colors.AppDarkBlue
        cell.accessoryType = .detailButton
        cell.roomLabel.text = "München P, PC-Raum 03"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}


