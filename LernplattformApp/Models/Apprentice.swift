//
//  Apprentice.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import Foundation

struct ApprenticeApiResult: Decodable {
    let result: ApprenticeResult
}

struct ApprenticeResult: Decodable {
    let gender: String
    let name: Name
    let image: String
    let job: String
    let group: String
    let trainingscenter: String
}

struct Name: Decodable {
    let first: String
    let last: String
}
