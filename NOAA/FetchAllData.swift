//
//  FetchAllData.swift
//  NOAA
//
//  Created by Julian Post on 9/14/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit

class FetchAllData {
    
    
    
    static func precip(_ view: UIView) {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        
        CallNOAA.requestWeather(dateFor.stringOfCurrentYearStart, endDate: dateFor.stringOfCurrentYearEnd, dataSet: "GHCND", dataType: "PRCP")
        { responseObject in
            // use responseObject and error here
            //print(responseObject.count)
            mainWeatherData.currentYearPrecipDict = responseObject
            mainWeatherData.currentYearPrecipArray = TransformArray.toSimple(mainWeatherData.currentYearPrecipDict)
            mainWeatherData.currentYearPrecipCumulative = TransformArray.toCumulative(mainWeatherData.currentYearPrecipArray)
            mainWeatherData.currentMonthPrecipArray = TransformArray.toCurrentMonth(mainWeatherData.currentYearPrecipDict)
            mainWeatherData.currentWeekPrecipArray = TransformArray.toCurrentWeek(mainWeatherData.currentYearPrecipDict)
            mainWeatherData.currentPrecipLoaded = true
            UpdateView.handlePrecipCompletion(view)
            
            return
        }
            
        
        CallNOAA.requestWeather(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd , dataSet: "NORMAL_DLY", dataType: "YTD-PRCP-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalYearPrecipDict = responseObject
            mainWeatherData.normalYearPrecipArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthPrecipArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekPrecipArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalPrecipLoaded = true
            UpdateView.handlePrecipCompletion(view)
            //print("normal \(mainWeatherData.normalPrecipArray)")
            
            
            //print("responseObject = \(responseObject)")
            return
        }
        
    }
    
    static func temp(_ view: UIView) {
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        
        CallNOAA.requestWeather(dateFor.stringOfCurrentYearStart, endDate: dateFor.stringOfCurrentYearEnd, dataSet: "GHCND", dataType: "TMAX") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMaxDict = responseObject
            mainWeatherData.currentYearTemperatureMaxArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentTMAXLoaded = true
            UpdateView.handleTempCompletion(view)
            //print("CurrentMax\(mainWeatherData.currentYearTemperatureMaxArray)")

            return
        }
 
        CallNOAA.requestWeather(dateFor.stringOfCurrentYearStart, endDate: dateFor.stringOfCurrentYearEnd, dataSet: "GHCND", dataType: "TMIN") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMinDict = responseObject
            mainWeatherData.currentYearTemperatureMinArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentTMINLoaded = true
            UpdateView.handleTempCompletion(view)
            //print("CurrentMin\(mainWeatherData.currentYearTemperatureMinArray)")
 
            return
        }
 
 
        CallNOAA.requestWeather(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd, dataSet: "NORMAL_DLY", dataType: "DLY-TMAX-NORMAL") { responseObject in
            // use responseObject and error here
            
            mainWeatherData.normalYearTemperatureMaxDict = responseObject
            mainWeatherData.normalYearTemperatureMaxArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthTemperatureMaxArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekTemperatureMaxArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalTMAXLoaded = true
            UpdateView.handleTempCompletion(view)
            //print("NormalMax\(mainWeatherData.normalYearTemperatureMaxArray)")

            return
        }
        
        CallNOAA.requestWeather(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd, dataSet: "NORMAL_DLY", dataType: "DLY-TMIN-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalYearTemperatureMinDict = responseObject
            mainWeatherData.normalYearTemperatureMinArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthTemperatureMinArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekTemperatureMinArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalTMINLoaded = true
            UpdateView.handleTempCompletion(view)
            //print("NormalMin\(mainWeatherData.normalYearTemperatureMinArray)")
          
            return
        }
        
    }
    
    

}
