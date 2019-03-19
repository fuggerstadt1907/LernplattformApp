//
//  GradesViewController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 04.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class GradesViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    // ---------------
    // MARK: - Declarations
    // ---------------
    var helper = [
        ExpandableNames(isExpanded: true, names: ["Databases and Developement"]),
        ExpandableNames(isExpanded: true, names: ["Business Knigge"]),
        ExpandableNames(isExpanded: true, names: ["English Rosetta Stone"])
    ]
    var helperId = [Int]()
    fileprivate let finalGradeCellId = "finalGradeCell"
    fileprivate let moduleHeaderCellId = "moduleHeaderCell"
    fileprivate let moduleGradeCellId = "moduleGradeCell"
    var gradesToBeConfirmedCount: Int = 0
    
    let gradesConfirmInfoText: UILabel = {
        let l = UILabel()
        l.text = "Grades to be confirmed:"
        l.font = .boldSystemFont(ofSize: 18)
        l.numberOfLines = 0
        l.adjustsFontSizeToFitWidth = true
        l.textAlignment = .center
        return l
    }()
    
    let finalGradeTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = Colors.AppDarkBlue
        tv.alwaysBounceVertical = false
        tv.alwaysBounceHorizontal = false
        tv.layer.cornerRadius = 10
        return tv
    }()
    
    let modulesGradeView: UIView = {
        let v = UIView()
        v.clipsToBounds = true
        return v
    }()
    
    let moduleGradeTableView: UITableView = {
        let tv = UITableView()
        tv.alwaysBounceVertical = false
        tv.alwaysBounceHorizontal = false
        tv.layer.cornerRadius = 10
        return tv
    }()
    
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "My Grades"
        setupConfirmGradesUI()
        setupGradesTableView()
    }
    
    fileprivate func setupConfirmGradesUI() {
        collectionView.addSubview(gradesConfirmInfoText)
        gradesConfirmInfoText.anchor(top: collectionView.topAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 30)
        gradesConfirmInfoText.text = "\(gradesConfirmInfoText.text!) \(gradesToBeConfirmedCount)"
    }
    
    
    // ---------------
    // MARK: - Fetching API Data
    // ---------------
    
}


extension GradesViewController: UITableViewDelegate, UITableViewDataSource {
    fileprivate func setupGradesTableView() {
        setupFinalGradeCell()
        setupModuleGradeCells()
    }
    
    fileprivate func setupFinalGradeCell() {
        finalGradeTableView.delegate = self
        finalGradeTableView.dataSource = self
        finalGradeTableView.register(FinalGradeCell.self, forCellReuseIdentifier: finalGradeCellId)
        collectionView.addSubview(finalGradeTableView)
        finalGradeTableView.anchor(top: gradesConfirmInfoText.bottomAnchor, left: collectionView.leftAnchor, bottom: nil, right: collectionView.rightAnchor, paddingTop: 20, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 60)
    }
    
    fileprivate func setupModuleGradeCells() {
        moduleGradeTableView.delegate = self
        moduleGradeTableView.dataSource = self
        moduleGradeTableView.separatorStyle = .none
        moduleGradeTableView.register(GradesCustomHeaderCell.self, forHeaderFooterViewReuseIdentifier: moduleHeaderCellId)
        moduleGradeTableView.register(ModuleGradeCell.self, forCellReuseIdentifier: moduleGradeCellId)
        collectionView.addSubview(modulesGradeView)
        modulesGradeView.anchor(top: finalGradeTableView.bottomAnchor, left: collectionView.leftAnchor, bottom: collectionView.bottomAnchor, right: collectionView.rightAnchor, paddingTop: 20, paddingLeft: 24, paddingBottom: 20, paddingRight: 24, width: 0, height: 0)
        modulesGradeView.addSubview(moduleGradeTableView)
        moduleGradeTableView.anchor(top: modulesGradeView.topAnchor, left: modulesGradeView.leftAnchor, bottom: modulesGradeView.bottomAnchor, right: modulesGradeView.rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == finalGradeTableView {
            return 1
        }
        else {
            if !helper[section].isExpanded {
                return 0
            }
            return helper[section].names.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == finalGradeTableView {
            return 1
        }
        else {
            return helper.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == finalGradeTableView {
            return 0
        }
        else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == finalGradeTableView {
            return nil
        }
        else {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: moduleHeaderCellId) as! GradesCustomHeaderCell
            header.toggleDelegate = self
            //header.buttonID = section
            header.toggleDropdownButton.tag = section
            header.moduleTitleLabel.text = helper[section].names.description
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == finalGradeTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: finalGradeCellId, for: indexPath) as! FinalGradeCell
            cell.backgroundColor = Colors.AppDarkBlue
            cell.selectionStyle = .none
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: moduleGradeCellId, for: indexPath) //as! ModuleGradeCell
            cell.textLabel?.text = "Test..."
            cell.backgroundColor = .lightGray
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


extension GradesViewController: GradesCustomHeaderCellDelegate {
    func toggleModule(button: UIButton) {
        let section = button.tag
        var indexPaths = [IndexPath]()
        for row in helper[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = helper[section].isExpanded
        helper[section].isExpanded = !isExpanded
        
        if isExpanded {
            moduleGradeTableView.deleteRows(at: indexPaths, with: .fade)
            button.setImage(UIImage(named: "arrow_down")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        else {
            moduleGradeTableView.insertRows(at: indexPaths, with: .fade)
            button.setImage(UIImage(named: "arrow_up")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }  
    }
}


struct ExpandableNames {
    var isExpanded: Bool
    let names: [String]
}
