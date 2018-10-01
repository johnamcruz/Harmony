//
//  CustomSegmentedControl.swift
//  Harmony
//
//  Created by John M Cruz on 9/30/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation
import UIKit

class CustomSegmentedControl : UISegmentedControl {
    var buttonBar = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupControl()
    }
    
    func setupControl() {
        self.backgroundColor = .clear
        self.tintColor = .clear
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Montserrat-Medium", size: 12)!,
            NSAttributedString.Key.foregroundColor: UIColor.warmGrey
            ], for: .normal)
        
        self.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Montserrat-Medium", size: 12)!,
            NSAttributedString.Key.foregroundColor: UIColor.greenBlue
            ], for: .selected)
        
        // This needs to be false since we are using auto layout constraints
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = UIColor.greenBlue
        self.addSubview(buttonBar)
        
        buttonBar.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / CGFloat(self.numberOfSegments)).isActive = true
        
        self.addTarget(self, action: #selector(self.segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.frame.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
        }
    }
}
