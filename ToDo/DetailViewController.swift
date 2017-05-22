//
//  DetailViewController.swift
//  ToDo
//
//  Created by Jesse Sahli on 5/7/17.
//  Copyright © 2017 JS. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter }()
        

    
    var itemInfo: (ItemManager, Int)?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let itemInfo = itemInfo else {
            return
        }
        let item = itemInfo.0.item(at: itemInfo.1)
        titleLabel.text = item.title
        locationNameLabel.text = item.location?.name
        descriptionLabel.text = item.description
        
        if let timestamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timestamp)
            dateLabel.text = dateFormatter.string(from: date)
        }
        if let coordinate = item.location?.coordinate {
            let region = MKCoordinateRegionMakeWithDistance(coordinate, 100, 100)
            mapView.region = region
        }
        
    }
    
    func checkItem() {
        if let itemInfo = itemInfo {
            itemInfo.0.checkItem(at: itemInfo.1)
        }
    }
    
}
