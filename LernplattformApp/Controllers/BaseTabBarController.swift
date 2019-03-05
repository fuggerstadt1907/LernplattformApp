//
//  BaseTabBarController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 04.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // ---------------
    // MARK: - Setting up the view
    // ---------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: PlanningViewController(), title: "Planung", imageName: "planning_icon", prefersLargeTitles: false),
            createNavController(viewController: GradesViewController(), title: "Noten", imageName: "grades_icon", prefersLargeTitles: false),
            createNavController(viewController: ProfileViewController(), title: "Profil", imageName: "profile_icon", prefersLargeTitles: false)
        ]
    }
    
    // ---------------
    // MARK: - Refactoring
    // ---------------
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String, prefersLargeTitles: Bool) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = prefersLargeTitles
        navController.navigationBar.barTintColor = Colors.AppDarkBlue
        navController.navigationBar.barStyle = .black
        navController.navigationBar.isTranslucent = false
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
    
        self.tabBar.barTintColor = Colors.AppDarkBlue
        self.tabBar.tintColor = Colors.AppOrange
        self.tabBar.isTranslucent = false
        
        viewController.view.backgroundColor = .white
        
        return navController
    }
    
}
