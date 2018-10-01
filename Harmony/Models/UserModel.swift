//
//  UserModel.swift
//  Harmony
//
//  Created by John M Cruz on 9/30/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation

struct UserModel : Codable {
    var id : Int
    var name : String
    var username : String
    var email : String!
    var address : AddressModel!
    
    init(id: Int, name: String, username: String, email: String!, address: AddressModel!) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
    }
}
