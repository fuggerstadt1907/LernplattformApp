//
//  Service.swift
//  LernplattformApp
//
//  Created by Alessandro Orlandi on 06.03.19.
//  Copyright © 2019 Alessandro Orlandi. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchPlanning(completion: @escaping (PlanningApiResult?, Error?) -> ()){
        let urlString = "https://api.myjson.com/bins/hdtoe"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchApprenticePersonalData(completion: @escaping (ApprenticeApiResult?, Error?) -> ()){
        let urlString = "https://api.myjson.com/bins/j64hq"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    // Generic JSON Functions
    // T is to declare the type later on
    fileprivate func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            guard let data = data else { return }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                completion(objects, nil)
            }
            catch let jsonErr {
                completion(nil, jsonErr)
                print("Failed to decode JSON data: ", jsonErr)
            }
            }.resume()
    }
}

