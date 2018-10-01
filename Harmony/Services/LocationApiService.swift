//
//  LocationApiService.swift
//  Harmony
//
//  Created by John M Cruz on 9/30/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation

protocol LocationApiServiceDelegate {
    func getLocations(url: String, completion: @escaping ([LocationModel]) -> Void)
}

class LocationApiService : LocationApiServiceDelegate {
    func getLocations(url: String, completion: @escaping ([LocationModel]) -> Void) {
        guard let path = URL(string: url) else { return }
        URLSession.shared.dataTask(with: path) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let locations = try decoder.decode([LocationModel].self, from: data)
                completion(locations)
                
            } catch let err {
                print("Error", err)
            }
        }.resume()
    }
}
