//
//  BaseListController.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 04.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import UIKit

// To clean up our code we created this class
// All of our ControllerClasses contains this both init Functions
// To not repeat our self (DRY - dont reapeat yourself) we initialized the functs here and selected this Class as SuperClass

class BaseListController: UICollectionViewController {
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
