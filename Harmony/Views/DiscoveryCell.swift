//
//  DiscoveryCell.swift
//  Harmony
//
//  Created by John M Cruz on 9/29/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import UIKit

class DiscoveryCell: CardCell {
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    
    var title : String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    var imageUrl : String! {
        didSet {
            if let url = URL(string: imageUrl) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data!)
                    }
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
