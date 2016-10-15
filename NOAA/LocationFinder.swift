//
//  LocationFinder.swift
//  NOAA
//
//  Created by Julian Post on 10/15/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CallForLocations {
    
    
    static func requestLocationCategories(_ startDate: String, endDate: String, dataSet: String, dataType: String, completionHandler: @escaping ([String:String]) -> ()) {
        
        self.makeCategoryCall(startDate, endDate: endDate, dataSet: dataSet, dataType: dataType, completionHandler: completionHandler)
        
    }
    
    
    static func makeCategoryCall(_ startDate: String, endDate: String, dataSet: String, dataType: String, completionHandler: @escaping ([String:String]) -> ()) {
        
        var array: [[String:AnyObject]] = [[:]]
        var dict: [String:String] = [:]
        
        
        let headers = [
            "token": "qMbhulVTJqFjFMUdHrwmhbxVyIIeqmOs"
        ]
        
        
        let parameters = [
            
            "limit": "20",
            "datatypeid": dataType,
            "startdate": startDate,
            "enddate" : endDate,
            //"datasetid" : dataSet,
        ]
        
        
        Alamofire.request("https://www.ncdc.noaa.gov/cdo-web/api/v2/locationcategories?datasetid=\(dataSet)", parameters: parameters, headers: headers)
            .validate(statusCode: 200..<300).responseJSON { (responseData) -> Void in
                //debugPrint(responseData)
                switch responseData.result {
                case .success:
                    print("Validation Successful \(startDate)")
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    //  print(swiftyJsonVar)
                    
                    if let resData = swiftyJsonVar["results"].arrayObject {
                        array = resData as! [[String:AnyObject]]
                        //  print(arrayVar)
                        
                        for i in array {
                            if let name = i["name"], let value = i["id"] {
                                let stringOfName = "\(name)"
                                let stringOfValue = "\(value)"
                                dict[stringOfName] = stringOfValue
                                
                            }
                        }
                        
                        completionHandler(dict)
                        
                        //currentYearDict = dict
                        //mainWeatherData.currentYearPrecipArray = TransformArray.toSimple(dict)
                        //mainWeatherData.currentMonthPrecipArray = TransformArray.toCurrentMonth(dict)
                        //mainWeatherData.currentWeekPrecipArray = TransformArray.toCurrentWeek(dict)
                        //mainWeatherData.currentPrecipLoaded = true
                        //print(mainWeatherData.currentYearPrecipArray.count)
                        //UpdateView.handlePrecipCompletion(view)
                    }
                    
                    
                case .failure(let error):
                    print(error)
                }
                
                
                
                
        }
        
    }
    
    
    static func requestLocations(_ startDate: String, endDate: String, dataSet: String, dataType: String, completionHandler: @escaping ([String:String]) -> ()) {
        
        self.makeCall(startDate, endDate: endDate, dataSet: dataSet, dataType: dataType, completionHandler: completionHandler)
        
    }
    
    
    static func makeCall(_ startDate: String, endDate: String, dataSet: String, dataType: String, completionHandler: @escaping ([String:String]) -> ()) {
        
        var array: [[String:AnyObject]] = [[:]]
        var dict: [String:String] = [:]
        
        
        let headers = [
            "token": "qMbhulVTJqFjFMUdHrwmhbxVyIIeqmOs"
        ]
        
        
        let parameters = [
            
            "limit": "20",
            //"datatypeid": dataType,
            "datasetid" : "GHCND",
            "startdate": startDate,
            "enddate" : endDate,
            "locationcategoryid" : "ZIP:05401"
            //"datasetid" : dataSet,
        ]
        
        
        Alamofire.request("https://www.ncdc.noaa.gov/cdo-web/api/v2/locations?", parameters: parameters, headers: headers)
            .validate(statusCode: 200..<300).responseJSON { (responseData) -> Void in
                debugPrint(responseData)
                switch responseData.result {
                case .success:
                    print("Validation Successful \(startDate)")
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    //  print(swiftyJsonVar)
                    
                    if let resData = swiftyJsonVar["results"].arrayObject {
                        array = resData as! [[String:AnyObject]]
                        //  print(arrayVar)
                        
                        for i in array {
                            if let name = i["name"], let value = i["id"] {
                                let stringOfName = "\(name)"
                                let stringOfValue = "\(value)"
                                dict[stringOfName] = stringOfValue
                                
                            }
                        }
                        
                        completionHandler(dict)
                        
                        //currentYearDict = dict
                        //mainWeatherData.currentYearPrecipArray = TransformArray.toSimple(dict)
                        //mainWeatherData.currentMonthPrecipArray = TransformArray.toCurrentMonth(dict)
                        //mainWeatherData.currentWeekPrecipArray = TransformArray.toCurrentWeek(dict)
                        //mainWeatherData.currentPrecipLoaded = true
                        //print(mainWeatherData.currentYearPrecipArray.count)
                        //UpdateView.handlePrecipCompletion(view)
                    }
                    
                    
                case .failure(let error):
                    print(error)
                }
                
                
                
                
        }
        
    }


}
