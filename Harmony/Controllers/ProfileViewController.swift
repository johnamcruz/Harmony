//
//  ProfileViewController.swift
//  Harmony
//
//  Created by John M Cruz on 9/30/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var userLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    
    var userApiService = UserApiService()
    
    var imageUrl : String! {
        didSet {
            if let url = URL(string: imageUrl) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {
                        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
                        self.profileImageView.clipsToBounds = true
                        self.profileImageView.image = UIImage(data: data!)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageUrl = "https://via.placeholder.com/100x100"
        userApiService.getUsers(url: "http://jsonplaceholder.typicode.com/users", completion: { users in
            if let user = users.first {
                DispatchQueue.main.async {
                    self.userLabel.text = user.name
                    if let address = user.address?.city {
                        self.addressLabel.text = address
                    }
                }
            }
        })
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
