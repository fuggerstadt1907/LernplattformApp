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
            createNavController(viewController: PlanningViewController(), title: "Planning", imageName: "planning", imageNameUnselected: "planning_selected", prefersLargeTitles: true),
            createNavController(viewController: GradesViewController(), title: "Grades", imageName: "grades", imageNameUnselected: "grades_selected", prefersLargeTitles: false),
            createNavController(viewController: ProfileViewController(), title: "Profile", imageName: "profile", imageNameUnselected: "profile_selected", prefersLargeTitles: false)
        ]
    }
    
    // ---------------
    // MARK: - Refactoring
    // ---------------
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String, imageNameUnselected: String, prefersLargeTitles: Bool) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = prefersLargeTitles
        navController.navigationBar.barTintColor = Colors.AppDarkBlue
        navController.navigationBar.barStyle = .black
        navController.navigationBar.isTranslucent = false
        navController.tabBarItem.title = title
        navController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: imageNameUnselected)?.withRenderingMode(.alwaysOriginal))
    
        self.tabBar.barTintColor = Colors.AppDarkBlue
        self.tabBar.tintColor = Colors.AppOrange
        self.tabBar.isTranslucent = false
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.AppOrange], for: .selected)
        
        viewController.view.backgroundColor = .white
        
        return navController
    }
    
}
