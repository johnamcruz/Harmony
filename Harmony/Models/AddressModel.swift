//
//  AddressModel.swift
//  Harmony
//
//  Created by John M Cruz on 9/30/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation

struct AddressModel : Codable {
    var street : String
    var suite : String!
    var city : String
    var zipcode : String
    
    init(street : String, suite: String!, city: String, zipcode: String) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }
}
