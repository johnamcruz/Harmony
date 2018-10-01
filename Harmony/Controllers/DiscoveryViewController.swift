//
//  DiscoveryViewController.swift
//  Harmony
//
//  Created by John M Cruz on 9/29/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import UIKit

class DiscoveryViewController: UICollectionViewController {
    var reuseIdentifier = "DiscoveryCell"
    var locationApiService = LocationApiService()
    var locations = [LocationModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.paleGreyTwo
        
        locationApiService.getLocations(url: "http://jsonplaceholder.typicode.com/photos", completion: { results in
            self.locations.append(contentsOf: results)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func closeFilterModal(segue: UIStoryboardSegue) {
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let discoveryCell = cell as? DiscoveryCell {
            let location = locations[indexPath.row]
            discoveryCell.title = location.title
            discoveryCell.imageUrl = location.url
        }
        return cell
    }
}
