//
//  DiscoveryCell.swift
//  Harmony
//
//  Created by John M Cruz on 9/29/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import UIKit

class DiscoveryCell: UICollectionViewCell {
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
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = 2
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.paleGrey.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }
}
