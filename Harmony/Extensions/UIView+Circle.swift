//
//  UIView+Circle.swift
//  Harmony
//
//  Created by John M Cruz on 10/1/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func createCircle(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
