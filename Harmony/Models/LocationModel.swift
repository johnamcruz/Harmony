//
//  LocationModel.swift
//  Harmony
//
//  Created by John M Cruz on 9/29/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation

struct LocationModel : Codable {
    var title : String
    var url : String
    
    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}
