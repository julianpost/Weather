//
//  FetchAllData.swift
//  NOAA
//
//  Created by Julian Post on 9/14/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit

class FetchAllData {
    
    
    
    static func precip() {
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let currentYearStartDate = Date.currentYearStartMath(today)
        let currentYearEndDate = Date.currentYearEndMath(today)
        
        let currentYearStartDateString = formatter.stringFromDate(currentYearStartDate)
        let currentYearEndDateString = formatter.stringFromDate(currentYearEndDate)
        
        //print("currentYearStartDateString \(currentYearStartDateString)")
        //print("currentYearEndDateString \(currentYearEndDateString)")
        
        CallNOAA.requestWeather(currentYearStartDateString, endDate: currentYearEndDateString , dataSet: "GHCND", dataType: "PRCP") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearPrecipDict = responseObject
            mainWeatherData.currentYearPrecipArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentMonthPrecipArray = TransformArray.toCurrentMonth(responseObject)
            mainWeatherData.currentWeekPrecipArray = TransformArray.toCurrentWeek(responseObject)
            mainWeatherData.currentPrecipLoaded = true
            //print(mainWeatherData.currentYearPrecipArray)
            //print(mainWeatherData.currentMonthPrecipArray)
            //print(mainWeatherData.currentWeekPrecipArray)
            //print("responseObject = \(responseObject)")
            return
        }
        
        //print(currentYearPrecip)
        //print("currentYearPrecip \(currentYearPrecip.count)")
        
        
        let lastYearStartDate = Date.lastYearStartMath(today)
        let lastYearEndDate = Date.lastYearEndMath(today)
        
        let normalStartDate = Date.normalStartMath(today)
        let normalEndDate = Date.normalEndMath(today)
        
        let lastYearStartDateString = formatter.stringFromDate(lastYearStartDate)
        let lastYearEndDateString = formatter.stringFromDate(lastYearEndDate)
        
        let normalStartDateString = formatter.stringFromDate(normalStartDate)
        let normalEndDateString = formatter.stringFromDate(normalEndDate)
        
        //  print("lastYearStartDateString \(lastYearStartDateString)")
        //  print("lastYearEndDateString \(lastYearEndDateString)")
        
        //  print("normalStartDateString \(normalStartDateString)")
        //  print("normalEndDateString \(normalEndDateString)")
        
        
        CallNOAA.requestWeather(normalStartDateString, endDate: normalEndDateString , dataSet: "NORMAL_DLY", dataType: "DLY-PRCP-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalPrecipDict = responseObject
            mainWeatherData.normalPrecipArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthPrecipArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekPrecipArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalPrecipLoaded = true
            print("normal \(mainWeatherData.normalPrecipArray)")
            //print(mainWeatherData.normalMonthPrecipArray)
            //print(mainWeatherData.normalWeekPrecipArray)
            //print(mainWeatherData.normalPrecipArray)
            
            print("responseObject = \(responseObject)")
            return
        }
        
        //print(normalPrecip)
        //print("normalPrecip \(normalPrecip.count)")
        
        
    }
    
    static func temp() {
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let currentYearStartDate = Date.currentYearStartMath(today)
        let currentYearEndDate = Date.currentYearEndMath(today)
        
        let currentYearStartDateString = formatter.stringFromDate(currentYearStartDate)
        let currentYearEndDateString = formatter.stringFromDate(currentYearEndDate)
        
        //print("currentYearStartDateString \(currentYearStartDateString)")
        //print("currentYearEndDateString \(currentYearEndDateString)")
        
        
        CallNOAA.requestWeather(currentYearStartDateString, endDate: currentYearEndDateString , dataSet: "GHCND", dataType: "TMAX") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMaxDict = responseObject
            mainWeatherData.currentYearTemperatureMaxArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentTMAXLoaded = true
            //print(mainWeatherData.normalPrecipArray)
            
            //print("responseObject = \(responseObject)")
            return
        }
        
        //print(currentYearTemperatureMax)
        //print("currentYearTemperatureMax \(currentYearTemperatureMax.count)")
        
        CallNOAA.requestWeather(currentYearStartDateString, endDate: currentYearEndDateString , dataSet: "GHCND", dataType: "TMIN") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMinDict = responseObject
            mainWeatherData.currentYearTemperatureMinArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentTMINLoaded = true
            //print(mainWeatherData.normalPrecipArray)
            
            //print("responseObject = \(responseObject)")
            return
        }
        
        let lastYearStartDate = Date.lastYearStartMath(today)
        let lastYearEndDate = Date.lastYearEndMath(today)
        
        let normalStartDate = Date.normalStartMath(today)
        let normalEndDate = Date.normalEndMath(today)
        
        let lastYearStartDateString = formatter.stringFromDate(lastYearStartDate)
        let lastYearEndDateString = formatter.stringFromDate(lastYearEndDate)
        
        let normalStartDateString = formatter.stringFromDate(normalStartDate)
        let normalEndDateString = formatter.stringFromDate(normalEndDate)
        
        //  print("lastYearStartDateString \(lastYearStartDateString)")
        //  print("lastYearEndDateString \(lastYearEndDateString)")
        
        //  print("normalStartDateString \(normalStartDateString)")
        //  print("normalEndDateString \(normalEndDateString)")
        
        
        
        CallNOAA.requestWeather(normalStartDateString, endDate: normalEndDateString , dataSet: "NORMAL_DLY", dataType: "DLY-TMAX-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalTemperatureMaxDict = responseObject
            mainWeatherData.normalTemperatureMaxArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthTemperatureMaxArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekTemperatureMaxArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalTMAXLoaded = true
            //print(mainWeatherData.normalTemperatureMaxArray)
            //print(mainWeatherData.normalMonthTemperatureMaxArray)
            //print(mainWeatherData.normalWeekTemperatureMaxArray)
            //print(mainWeatherData.normalTemperatureMaxArray)
            
            //print("responseObject = \(responseObject)")
            return
        }
        
        CallNOAA.requestWeather(normalStartDateString, endDate: normalEndDateString , dataSet: "NORMAL_DLY", dataType: "DLY-TMIN-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalTemperatureMinDict = responseObject
            mainWeatherData.normalTemperatureMinArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthTemperatureMinArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekTemperatureMinArray = TransformArray.toNormalWeek(responseObject)
            mainWeatherData.normalTMINLoaded = true
            //print(mainWeatherData.normalTemperatureMinArray)
            //print(mainWeatherData.normalMonthTemperatureMinArray)
            //print(mainWeatherData.normalWeekTemperatureMinArray)
            //print(mainWeatherData.normalTemperatureMinArray)
            
            //print("responseObject = \(responseObject)")
            return
        }
        
        //print(currentYearTemperatureMax)
        //print("normalTemperatureMax \(normalTemperatureMax.count)")
        
        // CallNOAA.requestWeather(normalStartDateString, endDate: normalEndDateString , dataSet: "NORMAL_DLY", dataType: "DLY-TMIN-NORMAL") { responseObject in
        // use responseObject and error here
        //  mainWeatherData.normalTemperatureMinDict = responseObject
        //  mainWeatherData.normalTemperatureMinArray = TransformArray.toSimple(responseObject)
        //  print("TMIN normal: \(mainWeatherData.normalTemperatureMinArray)")
        //print("responseObject = \(responseObject)")
        //       return
        //    }
        
        var newArray: [Float]
        newArray = TransformArray.toDegreeDay(50.0, maxTemp: 86.0, tMin: mainWeatherData.normalTemperatureMinArray, tMax: mainWeatherData.normalTemperatureMaxArray)
        mainWeatherData.degreeDayCumulativeNormal = TransformArray.toCumulative(newArray)
        print(mainWeatherData.degreeDayCumulativeNormal)
        print("done")
    }
    
    
    

}