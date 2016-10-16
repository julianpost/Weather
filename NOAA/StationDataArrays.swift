//
//  StationDataArrays.swift
//  NOAA
//
//  Created by Julian Post on 10/16/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation

struct StationDataArrays {
    
    var stationsArray: [String]
    var currentStation: String
    
    init(stationsArray: [String], currentStation: String) {
        
        
        self.stationsArray = ["Staten Island", "Brooklyn", "Manhattan", "Bronx", "Queens", "GHCND:USW00014742"]
        self.currentStation = "GHCND:USW00014742"
        
    }
    
    
}

var mainStationData = StationDataArrays(stationsArray: [], currentStation: "")
