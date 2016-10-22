//
//  LocationFinderViewController.swift
//  NOAA
//
//  Created by Julian Post on 10/22/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

class LocationFinderViewController: UIViewController, CLLocationManagerDelegate {
    
    var placesClient: GMSPlacesClient?
    
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSPlacesClient.provideAPIKey("AIzaSyA3Flb3HdA0EjlxVoxnEMUesGSBKhM6r_s")
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        placesClient = GMSPlacesClient.shared()
    }
    
    // Add a UIButton in Interface Builder, and connect the action to this function.
    
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        placesClient?.currentPlace(callback: {
            (placeLikelihoodList: GMSPlaceLikelihoodList?, error: Error?) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress!.components(separatedBy: ", ")
                        .joined(separator: "\n")
                }
            }
        })
    }

   }
