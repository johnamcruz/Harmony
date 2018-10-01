//
//  LocationViewController.swift
//  Harmony
//
//  Created by John M Cruz on 9/30/18.
//  Copyright © 2018 John M Cruz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "LocationCell"

class LocationViewController: UICollectionViewController {

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

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let locationCell = cell as? LocationCell {
            let location = locations[indexPath.row]
            locationCell.title = location.title
            locationCell.imageUrl = location.url
        }
        return cell
    }
}
