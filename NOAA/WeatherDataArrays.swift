//
//  WeatherDataArrays.swift
//  NOAA
//
//  Created by Julian Post on 7/30/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//


import Foundation

struct WeatherDataArrays {

var currentYearPrecipArray, currentYearTemperatureMaxArray, currentYearTemperatureMinArray, lastYearPrecipArray, lastYearTemperatureMaxArray,lastYearTemperatureMinArray: [Float]

var currentYearPrecipDict, currentYearTemperatureMaxDict, currentYearTemperatureMinDict, lastYearPrecipDict, lastYearTemperatureMaxDict, lastYearTemperatureMinDict, precipCumulativeLastYear, precipCumulativeThisYear: [NSDate : Float]
    
init(currentYearPrecipArray: [Float], currentYearTemperatureMaxArray: [Float], currentYearTemperatureMinArray: [Float], lastYearPrecipArray: [Float], lastYearTemperatureMaxArray: [Float],lastYearTemperatureMinArray: [Float], currentYearPrecipDict: [NSDate : Float], currentYearTemperatureMaxDict: [NSDate : Float], currentYearTemperatureMinDict: [NSDate : Float], lastYearPrecipDict: [NSDate : Float], lastYearTemperatureMaxDict: [NSDate : Float], lastYearTemperatureMinDict: [NSDate : Float], precipCumulativeLastYear: [NSDate : Float], precipCumulativeThisYear: [NSDate : Float]) {
    
    let today = NSDate()
    let gregorian: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    
    var blankDict:[NSDate : Float] = [:]
    var start = Date.lastYearStartMath(today)
    var end = Date.lastYearEndMath(today)
     var counter: Float = 1
    
    let dateComponents = NSDateComponents()
    dateComponents.day = 1
    end = gregorian.dateByAddingComponents(dateComponents, toDate: end, options: NSCalendarOptions(rawValue: 0))!
    
    repeat {
        
        blankDict[start] = counter
        
       // print(blankDict.count)
       // print(start)
        //print(blankDict[end])
       // print("end: \(end)")
        
        counter += 0.1
        
        // increment the date by 1 day
        let dateComponents = NSDateComponents()
        dateComponents.day = 1
        start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendarOptions(rawValue: 0))!
        
        
    } while start != end
    
    print(blankDict)
    
    let sortedDict = blankDict.sort { $0.0.compare($1.0) == .OrderedAscending }
    
    
    var arr: [Float] = []
    for (_,value) in sortedDict {
        
        arr.append(value)
        
    }
//print(arr)
    
    var precipCalc:[NSDate : Float] = [:]
    var startMinusOne = Date.lastYearStartMath(today)
   
    
    // changes end date to Jan 1 of the next year so loop will complete all 365 values
    let endDateComponents = NSDateComponents()
    endDateComponents.day = 1
    end = gregorian.dateByAddingComponents(endDateComponents, toDate: end, options: NSCalendarOptions(rawValue: 0))!
    
    //changes startMinusOne date so that it can be used to add values cumulatively
    let startMinusOneDateComponents = NSDateComponents()
    startMinusOneDateComponents.day = -1
    startMinusOne = gregorian.dateByAddingComponents(startMinusOneDateComponents, toDate: startMinusOne, options: NSCalendarOptions(rawValue: 0))!
    
   /* repeat {
        
        precipCalc[start] = mainWeatherData.lastYearPrecipDict[start]! + (mainWeatherData.lastYearPrecipDict[startMinusOne] ?? 0.0)
        
        // print("end: \(precipCalc)")
        
        
        // increment the date by 1 day
        let dateComponents = NSDateComponents()
        dateComponents.day = 1
        start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendarOptions(rawValue: 0))!
        startMinusOne = gregorian.dateByAddingComponents(dateComponents, toDate: startMinusOne, options: NSCalendarOptions(rawValue: 0))!
        
    } while start != end
   */
    
  
    
    self.currentYearPrecipDict = blankDict
    self.currentYearTemperatureMaxDict = blankDict
    self.currentYearTemperatureMinDict = blankDict
    self.lastYearPrecipDict = blankDict
    self.lastYearTemperatureMaxDict = blankDict
    self.lastYearTemperatureMinDict = blankDict
    
    self.currentYearPrecipArray = arr
    self.currentYearTemperatureMaxArray = arr
    self.currentYearTemperatureMinArray = arr
    self.lastYearPrecipArray = arr
    self.lastYearTemperatureMaxArray = arr
    self.lastYearTemperatureMinArray = arr
    
    self.precipCumulativeLastYear = precipCalc
    self.precipCumulativeThisYear = precipCalc

    

    }
    
    
}

/*var mainWeatherData = WeatherDataArrays(currentYearPrecipArray: arr, currentYearTemperatureMaxArray: arr, currentYearTemperatureMinArray: arr, lastYearPrecipArray: arr, lastYearTemperatureMaxArray: arr, lastYearTemperatureMinArray: arr, currentYearPrecipDict: blankDict, currentYearTemperatureMaxDict: blankDict, currentYearTemperatureMinDict: blankDict, lastYearPrecipDict: blankDict, lastYearTemperatureMaxDict: blankDict, lastYearTemperatureMinDict: blankDict, precipCumulativeLastYear: blankDict, precipCumulativeThisYear: blankDict)
*/

var mainWeatherData = WeatherDataArrays(currentYearPrecipArray: [], currentYearTemperatureMaxArray: [], currentYearTemperatureMinArray: [], lastYearPrecipArray: [], lastYearTemperatureMaxArray: [],lastYearTemperatureMinArray: [], currentYearPrecipDict: [:], currentYearTemperatureMaxDict: [:], currentYearTemperatureMinDict: [:], lastYearPrecipDict: [:], lastYearTemperatureMaxDict: [:], lastYearTemperatureMinDict: [:], precipCumulativeLastYear: [:], precipCumulativeThisYear: [:])


/*
 
 let today = NSDate()
 let gregorian: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
 
 var blankDict:[NSDate : Float] = [:]
 var start = Date.lastYearStartMath(today)
 var end = Date.lastYearEndMath(today)
 var counter: Float = 1
 
 let dateComponents = NSDateComponents()
 dateComponents.day = 1
 end = gregorian.dateByAddingComponents(dateComponents, toDate: end, options: NSCalendarOptions(rawValue: 0))!
 
 repeat {
 
 blankDict[start] = counter
 
 // print(blankDict.count)
 // print(start)
 //print(blankDict[end])
 // print("end: \(end)")
 
 counter += 0.1
 
 // increment the date by 1 day
 let dateComponents = NSDateComponents()
 dateComponents.day = 1
 start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendarOptions(rawValue: 0))!
 
 
 } while start != end
 
 print(blankDict)
 
 let sortedDict = blankDict.sort { $0.0.compare($1.0) == .OrderedAscending }
 
 
 var arr: [Float] = []
 for (_,value) in sortedDict {
 
 arr.append(value)
 
 }
 print(arr)

var precipCalc:[NSDate : Float] = [:]
var startMinusOne = Date.lastYearStartMath(today)


// changes end date to Jan 1 of the next year so loop will complete all 365 values
let endDateComponents = NSDateComponents()
endDateComponents.day = 1
end = gregorian.dateByAddingComponents(endDateComponents, toDate: end, options: NSCalendarOptions(rawValue: 0))!

//changes startMinusOne date so that it can be used to add values cumulatively
let startMinusOneDateComponents = NSDateComponents()
startMinusOneDateComponents.day = -1
startMinusOne = gregorian.dateByAddingComponents(startMinusOneDateComponents, toDate: startMinusOne, options: NSCalendarOptions(rawValue: 0))!

repeat {
    
    precipCalc[start] = mainWeatherData.lastYearPrecipDict[start]! + (mainWeatherData.lastYearPrecipDict[startMinusOne] ?? 0.0)
    
    // print("end: \(precipCalc)")
    
    
    // increment the date by 1 day
    let dateComponents = NSDateComponents()
    dateComponents.day = 1
    start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendarOptions(rawValue: 0))!
    startMinusOne = gregorian.dateByAddingComponents(dateComponents, toDate: startMinusOne, options: NSCalendarOptions(rawValue: 0))!
    
} while start != end
 
 */



