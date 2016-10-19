//
//  SettingsDataArrays.swift
//  NOAA
//
//  Created by Julian Post on 10/16/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation

struct SettingsDataArrays {
    
    var stationsArray: [String]
    var currentStation: String
    var minTempOne, maxTempOne, minTempTwo, maxTempTwo, minTempThree, maxTempThree: Int
    
    init(stationsArray: [String], currentStation: String, minTempOne: Int, maxTempOne: Int, minTempTwo: Int, maxTempTwo: Int, minTempThree: Int, maxTempThree: Int) {
        
        
        self.stationsArray = ["Staten Island", "Brooklyn", "Manhattan", "Bronx", "Queens", "GHCND:USW00014742"]
        self.currentStation = "GHCND:USW00014742"
        self.minTempOne = 52
        self.maxTempOne = 86
        self.minTempTwo = 32
        self.maxTempTwo = 86
        self.minTempThree = 46
        self.maxTempThree = 90
        
    }
    
    
}

var mainSettingsData = SettingsDataArrays(stationsArray: [], currentStation: "", minTempOne: 0, maxTempOne: 0, minTempTwo: 0, maxTempTwo: 0, minTempThree: 0, maxTempThree: 0)
