//
//  OrganizeRequests.swift
//  NOAA
//
//  Created by Julian Post on 7/25/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation


class OrganizeRequests {
    
    
    static func precipDictToArray() -> [NSDate : Float] {
    
        let precipDict = CallNOAA.requestPrecip()
    var precipArray: [NSDate : Float] = [:]
        
        for i in precipDict {
        if let date = i["date"], value = i["value"] {
            let stringOfDate = String(date)
            let formattedDate = Date.stringToNSDate(stringOfDate)
            let stringOfValue = String(value)
            let floatOfValue = Float(stringOfValue)
            precipArray[formattedDate] = floatOfValue
        }
      //  print(precipArray)
        
        }
    return precipArray
    
    }
    
    static func temperatureMaxDictToArray() -> [NSDate : Float] {
        
        let temperatureMaxDict = CallNOAA.requestTemperatureMax()
        var temperatureMaxArray: [NSDate : Float] = [:]
        
        for i in temperatureMaxDict {
            if let date = i["date"], value = i["value"] {
                let stringOfDate = String(date)
                let formattedDate = Date.stringToNSDate(stringOfDate)
                let stringOfValue = String(value)
                let floatOfValue = Float(stringOfValue)
                temperatureMaxArray[formattedDate] = floatOfValue
            }
                //  print(temperatureMaxArray)
            
        }
        return temperatureMaxArray
        
    }
    static func temperatureMinDictToArray() -> [NSDate : Float] {
        
        let temperatureMinDict = CallNOAA.requestTemperatureMin()
        var temperatureMinArray: [NSDate : Float] = [:]
        
        for i in temperatureMinDict {
            if let date = i["date"], value = i["value"] {
                let stringOfDate = String(date)
                let formattedDate = Date.stringToNSDate(stringOfDate)
                let stringOfValue = String(value)
                let floatOfValue = Float(stringOfValue)
                temperatureMinArray[formattedDate] = floatOfValue
            }
            //  print(temperatureMinArray)
            
        }
        return temperatureMinArray
        
    }


}