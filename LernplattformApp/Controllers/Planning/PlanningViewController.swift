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
    var planningViewControllerDelegate: PlanningViewControllerDelegate?
    fileprivate let cellId = "cellId"
    fileprivate var modules = [Module]()
    
    fileprivate var topCalendarView = CalendarView()
    
    fileprivate var topContainerView: UIView = {
        let cv = UIView()
        cv.clipsToBounds = true
        return cv
    }()
    
    fileprivate var bottomContainerView: UIView = {
        let cv = UIView()        
        cv.clipsToBounds = true
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
        fetchApiData()
        setupNavigationBar()
        setupCalendarView()
        setupTableView()
    }
    
    fileprivate func setupNavigationBar() {
        let month = CVDate(date: Date(), calendar: Calendar(identifier: .gregorian))
        navigationItem.title = month.globalDescription
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(TodayBarButtonItemTapped))
        //navigationItem.leftBarButtonItem?.tintColor = .white
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(RefreshPlanningBarButtonItemTapped))
        //navigationItem.rightBarButtonItem?.tintColor = .white
        
        let leftBarButtonItem = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(TodayBarButtonItemTapped))
        leftBarButtonItem.tintColor = .white
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(RefreshPlanningBarButtonItemTapped))
        rightBarButtonItem.tintColor = .white
        
        
    }
    
    fileprivate func setupCalendarView() {
        topCalendarView.calendarDelegate = self
        collectionView.addSubview(topContainerView)
        topContainerView.addSubview(topCalendarView.view)
        topContainerView.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300)
        topCalendarView.view.fillSuperview()
    }
    
    
    
    // ---------------
    // MARK: - Fetching API Data
    // ---------------
    fileprivate func fetchApiData() {
        Service.shared.fetchPlanning { (res, err) in
            if let err = err {
                print("⚠️ Failed to fetch API Data:\n", err)
                return
            }
            self.modules = res?.result.modules ?? []
            print("✅ Fetched Modules:")
            for module in self.modules {
                print("\t‣ \(module.title)")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    // ---------------
    // MARK: - OBJC Functions
    // ---------------
    @objc fileprivate func TodayBarButtonItemTapped() {
        planningViewControllerDelegate?.setNavigationTitleToCurrentDay()
        
//        planningViewControllerDelegate?.toggleToCurrentDay()
//
//        planningViewControllerDelegate?.setNavigationTitleToCurrentDay()
//        calendarView.toggleCurrentDayView()
//        navigationItem.title = calendarView.presentedDate.globalDescription
    }
    
    @objc fileprivate func RefreshPlanningBarButtonItemTapped() {
        print("🔄 Refreshing planning...")
        fetchApiData()        
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
        return modules.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CalendarTableViewCell
        let sequence = modules[indexPath.row].sequences[indexPath.row]
        cell.subjectLabel.text = sequence.title
        cell.roomLabel.text = "\(sequence.trainingscenter) with \(sequence.trainer)"
        cell.timeLabel.text = "\(sequence.startingTime)\n\(sequence.endingTime)"
        cell.tintColor = Colors.AppDarkBlue
        cell.accessoryType = .detailButton
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = .clear
        }
    }
}


extension PlanningViewController: CustomCalendarViewDelegate {
    func changeNavigationTitle(to Title: String) {
        navigationItem.title = Title
    }
}


