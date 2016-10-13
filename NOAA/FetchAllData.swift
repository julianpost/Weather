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
        
        
        CallNOAA.requestWeather(dateFor.stringOfCurrentYearStart, endDate: dateFor.stringOfCurrentYearEnd, dataSet: "GHCND", dataType: "PRCP") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearPrecipDict = responseObject
            mainWeatherData.currentYearPrecipArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentMonthPrecipArray = TransformArray.toCurrentMonth(responseObject)
            mainWeatherData.currentWeekPrecipArray = TransformArray.toCurrentWeek(responseObject)
            mainWeatherData.currentPrecipLoaded = true
            UpdateView.handlePrecipCompletion(view)
            
            return
        }
        
        CallNOAA.requestWeather(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd , dataSet: "NORMAL_DLY", dataType: "DLY-PRCP-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalPrecipDict = responseObject
            mainWeatherData.normalPrecipArray = TransformArray.toSimple(responseObject)
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

            return
        }
        
        CallNOAA.requestWeather(dateFor.stringOfCurrentYearStart, endDate: dateFor.stringOfCurrentYearEnd, dataSet: "GHCND", dataType: "TMIN") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMinDict = responseObject
            mainWeatherData.currentYearTemperatureMinArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentTMINLoaded = true
            UpdateView.handleTempCompletion(view)
            
 
            return
        }
        
        
        CallNOAA.requestWeather(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd, dataSet: "NORMAL_DLY", dataType: "DLY-TMAX-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalTemperatureMaxDict = responseObject
            mainWeatherData.normalTemperatureMaxArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthTemperatureMaxArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekTemperatureMaxArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalTMAXLoaded = true
            UpdateView.handleTempCompletion(view)

            return
        }
        
        CallNOAA.requestWeather(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd, dataSet: "NORMAL_DLY", dataType: "DLY-TMIN-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalTemperatureMinDict = responseObject
            mainWeatherData.normalTemperatureMinArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthTemperatureMinArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekTemperatureMinArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalTMINLoaded = true
            UpdateView.handleTempCompletion(view)
          
            return
        }
        
        
        var newArray: [Float]
        newArray = TransformArray.toDegreeDay(50.0, maxTemp: 86.0, tMin: mainWeatherData.normalTemperatureMinArray, tMax: mainWeatherData.normalTemperatureMaxArray)
        mainWeatherData.degreeDayCumulativeNormal = TransformArray.toCumulative(newArray)
        //print(mainWeatherData.degreeDayCumulativeNormal)
        
    }
    
    

}
