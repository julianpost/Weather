//
//  NOAARequests.swift
//  NOAA
//
//  Created by Julian Post on 7/25/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON






class CallNOAA {

    static func requestWeather(startDate: String, endDate: String, dataSet: String, dataType: String, completionHandler: [NSDate:Float] -> ()) {
        
        self.makeCall(startDate, endDate: endDate, dataSet: dataSet, dataType: dataType, completionHandler: completionHandler)
    
        
        
}
    
    
    static func makeCall(startDate: String, endDate: String, dataSet: String, dataType: String, completionHandler: ([NSDate:Float]) -> ()) {
    
        var array: [[String:AnyObject]] = [[:]]
        var dict: [NSDate:Float] = [:]
        
        
        let headers = [
            "token": "qMbhulVTJqFjFMUdHrwmhbxVyIIeqmOs"
        ]
        
        
        let parameters = [
            
            "limit": "365",
            //  "datasetid" : "NORMAL_DLY",
            "datatypeid": dataType,
            "startdate": startDate,
            "enddate" : endDate
            
        ]
        
        Alamofire.request(.GET,"https://www.ncdc.noaa.gov/cdo-web/api/v2/data?datasetid=\(dataSet)&stationid=GHCND:USW00014742&units=standard", parameters: parameters, headers: headers)
            .validate(statusCode: 200..<300).responseJSON { (responseData) -> Void in
                //debugPrint(responseData)
                switch responseData.result {
                case .Success/*(let completionValue)*/:
                    print("Validation Successful")
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    //  print(swiftyJsonVar)
                    
                    if let resData = swiftyJsonVar["results"].arrayObject {
                        array = resData as! [[String:AnyObject]]
                        //  print(arrayVar)
                        
                        for i in array {
                            if let date = i["date"], value = i["value"] {
                                let stringOfDate = String(date)
                                let formattedDate = Date.stringToNSDate(stringOfDate)
                                let stringOfValue = String(value)
                                let floatOfValue = Float(stringOfValue)
                                dict[formattedDate] = floatOfValue
                                completionHandler(dict)
                                //print(dict)
                            }
                            
                            
                        }
                    }
                    
                    
                case .Failure(let error):
                    print(error)
                }
                
                
                
                
        }

    
    }

/* static func requestTemperatureMax(startDate: String, endDate: String, dataSet: String, dataType: String, array: [[String:AnyObject]], dict: [NSDate : Float]) -> [NSDate : Float] {
    
    
    let headers = [
        "token": "qMbhulVTJqFjFMUdHrwmhbxVyIIeqmOs"
    ]
    
    let parameters = [
        
        "limit": "365",
        "datatypeid": dataType,
        "startdate": startDate,
        "enddate" : endDate
        
    ]
    
    Alamofire.request(.GET,"https://www.ncdc.noaa.gov/cdo-web/api/v2/data?datasetid=\(dataSet)&stationid=GHCND:USW00014742&units=standard", parameters: parameters, headers: headers)
        .responseJSON { (responseData) -> Void in
         //  debugPrint(responseData)
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
             //   print(swiftyJsonVar)
                
                if let resData = swiftyJsonVar["results"].arrayObject {
                    temperatureMaxArray = resData as! [[String:AnyObject]]
              //      print(temperatureMaxArray)
                    
                  
                    
                }
            }
            
        
    }
    
    
    for i in temperatureMaxArray {
        if let date = i["date"], value = i["value"] {
            let stringOfDate = String(date)
            let formattedDate = Date.stringToNSDate(stringOfDate)
            let stringOfValue = String(value)
            let floatOfValue = Float(stringOfValue)
            TemperatureMaxDict[formattedDate] = floatOfValue
            
            //   print(TemperatureMaxDict)
        }
        
    }
    
   
    return TemperatureMaxDict
}

static func requestTemperatureMin(startDate: String, endDate: String, dataSet: String, dataType: String, array: [[String:AnyObject]], dict: [NSDate : Float]) -> [NSDate : Float] {
    
    let headers = [
        "token": "qMbhulVTJqFjFMUdHrwmhbxVyIIeqmOs"
    ]
    
    let parameters = [
        
        "limit": "365",
        "datatypeid": dataType,
        "startdate": startDate,
        "enddate" : endDate
        
    ]
    
    Alamofire.request(.GET,"https://www.ncdc.noaa.gov/cdo-web/api/v2/data?datasetid=\(dataSet)&stationid=GHCND:USW00014742&units=standard", parameters: parameters, headers: headers)
        .responseJSON { (responseData) -> Void in
          //  debugPrint(responseData)
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
           //     print(swiftyJsonVar)
                
                if let resData = swiftyJsonVar["results"].arrayObject {
                    temperatureMinArray = resData as! [[String:AnyObject]]
                   // print(temperatureMinArray)
                    
                    
                }
            }
            
    }
    
    for i in temperatureMinArray {
        if let date = i["date"], value = i["value"] {
            let stringOfDate = String(date)
            let formattedDate = Date.stringToNSDate(stringOfDate)
            let stringOfValue = String(value)
            let floatOfValue = Float(stringOfValue)
            TemperatureMinDict[formattedDate] = floatOfValue
            
            //  print(TemperatureMinDict)
        }
        
    }
    
    return TemperatureMinDict
} */
    
}