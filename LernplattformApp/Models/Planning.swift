//
//  Planning.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import Foundation

struct PlanningResult: Decodable {
    let result: Result
}

struct Result: Decodable {
    let modules: [Module]
}

struct Module: Decodable {
    let id: String
    let title: String
    let sequences: [Sequence]
}

struct Sequence: Decodable {
    let id: String
    let title: String
    let trainingscenter: String
    let trainer: String
    let starting: String
    let ending: String
    let startingTime: String
    let endingTime: String
    let notes: String
    let grade: String?
    let isConfirmedByApprentice: Bool?
}
