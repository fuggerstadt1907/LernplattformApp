//
//  Apprentice.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import Foundation

struct ApprenticeApiResult {
    let result: ApprenticeResult
}

struct ApprenticeResult {
    let gender: String
    let name: Name
    let image: String
    let job: String
    let group: String
    let trainingscenter: String
}

struct Name {
    let first: String
    let last: String
}
