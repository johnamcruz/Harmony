//
//  RatingsControl.swift
//  Harmony
//
//  Created by John M Cruz on 10/1/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RatingsControl : UIControl {
    
    @IBInspectable var selectedColor : UIColor = UIColor.greenBlue
    
    @IBInspectable var unselectedColor : UIColor = UIColor.paleGrey
    
    @IBInspectable var radius : CGFloat = 15.0
    
    @IBInspectable var spacing : CGFloat = 12.0
    
    @IBInspectable var value : Int = 5
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupControl()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupControl()
    }
    
    override func prepareForInterfaceBuilder() {
        setupControl()
    }

    func setupControl() {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor.red
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = self.spacing
        
        for index in 1...5 {
            let view = UIView()
            view.backgroundColor = index <= value ? selectedColor : unselectedColor
            view.layer.cornerRadius = self.radius
            view.clipsToBounds = true
            let size = radius * 2
            view.heightAnchor.constraint(equalToConstant: size).isActive = true
            view.widthAnchor.constraint(equalToConstant: size).isActive = true
            view.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(view)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
