//
//  UserApiService.swift
//  Harmony
//
//  Created by John M Cruz on 9/30/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation

protocol UserApiServiceDelegate {
    func getUsers(url: String, completion: @escaping ([UserModel]) -> Void)
    func getUser(url: String, completion: @escaping (UserModel) -> Void)
}

class UserApiService {
    func getUsers(url: String, completion: @escaping ([UserModel]) -> Void) {
        guard let path = URL(string: url) else { return }
        URLSession.shared.dataTask(with: path) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([UserModel].self, from: data)
                completion(users)
                
            } catch let err {
                print("Error", err)
            }
        }.resume()
    }
    
    func getUser(url: String, completion: @escaping (UserModel) -> Void) {
        guard let path = URL(string: url) else { return }
        URLSession.shared.dataTask(with: path) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(UserModel.self, from: data)
                completion(user)
                
            } catch let err {
                print("Error", err)
            }
            }.resume()
    }
}
