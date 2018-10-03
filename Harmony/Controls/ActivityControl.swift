//
//  ActivityControl.swift
//  Harmony
//
//  Created by John M Cruz on 10/2/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ActivityControl : UIControl {
    
    let spacing : CGFloat = 9.0
    let buttonSize : CGFloat = 48.0
    let images = ["sport24PxOutlineUserRun","sport24PxOutlineUserSwim","transportation24PxOutlineBike","travel24PxOutlineFire","nature24PxOutlinePaw"]
    
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
        stackView.spacing = spacing
        
        for index in 0..<images.count {
            let button = UIButton(type: .custom)
            button.backgroundColor = UIColor.paleGreyTwo
            button.tintColor = UIColor.slateGrey
            if let image = UIImage(named: images[index]) {
                image.withRenderingMode(.alwaysTemplate)
                button.setImage(image, for: .normal)
            }
            button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
            button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
            button.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(button)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
