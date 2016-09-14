//
//  WeatherDataArrays.swift
//  NOAA
//
//  Created by Julian Post on 7/30/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//


import Foundation

struct WeatherDataArrays {

var currentYearPrecipArray, currentYearTemperatureMaxArray, currentYearTemperatureMinArray, normalPrecipArray, normalTemperatureMaxArray,normalTemperatureMinArray: [Float]
    
var currentMonthPrecipArray, currentMonthTemperatureMaxArray, currentMonthTemperatureMinArray, normalMonthPrecipArray, normalMonthTemperatureMaxArray,normalMonthTemperatureMinArray: [Float]

var currentWeekPrecipArray, currentWeekTemperatureMaxArray, currentWeekTemperatureMinArray, normalWeekPrecipArray, normalWeekTemperatureMaxArray,normalWeekTemperatureMinArray: [Float]
    
var currentYearPrecipDict, currentYearTemperatureMaxDict, currentYearTemperatureMinDict, normalPrecipDict, normalTemperatureMaxDict, normalTemperatureMinDict, precipCumulativeNormal, precipCumulativeThisYear: [NSDate : Float]
    
init(currentYearPrecipArray: [Float], currentYearTemperatureMaxArray: [Float], currentYearTemperatureMinArray: [Float], normalPrecipArray: [Float], normalTemperatureMaxArray: [Float],normalTemperatureMinArray: [Float], currentMonthPrecipArray: [Float], currentMonthTemperatureMaxArray: [Float], currentMonthTemperatureMinArray: [Float], normalMonthPrecipArray: [Float], normalMonthTemperatureMaxArray: [Float],normalMonthTemperatureMinArray: [Float], currentWeekPrecipArray: [Float], currentWeekTemperatureMaxArray: [Float], currentWeekTemperatureMinArray: [Float], normalWeekPrecipArray: [Float], normalWeekTemperatureMaxArray: [Float],normalWeekTemperatureMinArray: [Float],currentYearPrecipDict: [NSDate : Float], currentYearTemperatureMaxDict: [NSDate : Float], currentYearTemperatureMinDict: [NSDate : Float], normalPrecipDict: [NSDate : Float], normalTemperatureMaxDict: [NSDate : Float], normalTemperatureMinDict: [NSDate : Float], precipCumulativeNormal: [NSDate : Float], precipCumulativeThisYear: [NSDate : Float]) {
    
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
    
    //print(blankDict)
    
    let sortedDict = blankDict.sort { $0.0.compare($1.0) == .OrderedAscending }
    
    
    var arrYear: [Float] = []
    for (_,value) in sortedDict {
        
        arrYear.append(value)
        
    }
    
    var arrMonth: [Float] = []
    
    for i in 0...30 {
    
    arrMonth.insert(2, atIndex: i)
    
    }
    
    var arrWeek: [Float] = []
    
    for i in 0...6 {
        
        arrWeek.insert(2, atIndex: i)
        
    }
    
   // print("arrYear \(arrYear)")
   // print("arrMonth \(arrMonth)")
   // print("arrWeek \(arrWeek)")
    
    var precipCalc:[NSDate : Float] = [:]
    var startMinusOne = Date.normalStartMath(today)
   
    
    // changes end date to Jan 1 of the next year so loop will complete all 365 values
    let endDateComponents = NSDateComponents()
    endDateComponents.day = 1
    end = gregorian.dateByAddingComponents(endDateComponents, toDate: end, options: NSCalendarOptions(rawValue: 0))!
    
    //changes startMinusOne date so that it can be used to add values cumulatively
    let startMinusOneDateComponents = NSDateComponents()
    startMinusOneDateComponents.day = -1
    startMinusOne = gregorian.dateByAddingComponents(startMinusOneDateComponents, toDate: startMinusOne, options: NSCalendarOptions(rawValue: 0))!
    
   /* repeat {
        
        precipCalc[start] = mainWeatherData.normalPrecipDict[start]! + (mainWeatherData.normalPrecipDict[startMinusOne] ?? 0.0)
        
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
    self.normalPrecipDict = blankDict
    self.normalTemperatureMaxDict = blankDict
    self.normalTemperatureMinDict = blankDict
    
    self.currentYearPrecipArray = arrYear
    self.currentYearTemperatureMaxArray = arrYear
    self.currentYearTemperatureMinArray = arrYear
    self.normalPrecipArray = arrYear
    self.normalTemperatureMaxArray = arrYear
    self.normalTemperatureMinArray = arrYear
    
    self.currentMonthPrecipArray = arrMonth
    self.currentMonthTemperatureMaxArray = arrMonth
    self.currentMonthTemperatureMinArray = arrMonth
    self.normalMonthPrecipArray = arrMonth
    self.normalMonthTemperatureMaxArray = arrMonth
    self.normalMonthTemperatureMinArray = arrMonth
    
    self.currentWeekPrecipArray = arrWeek
    self.currentWeekTemperatureMaxArray = arrWeek
    self.currentWeekTemperatureMinArray = arrWeek
    self.normalWeekPrecipArray = arrWeek
    self.normalWeekTemperatureMaxArray = arrWeek
    self.normalWeekTemperatureMinArray = arrWeek
    
    self.precipCumulativeNormal = precipCalc
    self.precipCumulativeThisYear = precipCalc

    

    }
    
    
}

/*var mainWeatherData = WeatherDataArrays(currentYearPrecipArray: arr, currentYearTemperatureMaxArray: arr, currentYearTemperatureMinArray: arr, normalPrecipArray: arr, normalTemperatureMaxArray: arr, normalTemperatureMinArray: arr, currentYearPrecipDict: blankDict, currentYearTemperatureMaxDict: blankDict, currentYearTemperatureMinDict: blankDict, normalPrecipDict: blankDict, normalTemperatureMaxDict: blankDict, normalTemperatureMinDict: blankDict, precipCumulativenormal: blankDict, precipCumulativeThisYear: blankDict)
*/

var mainWeatherData = WeatherDataArrays(currentYearPrecipArray: [], currentYearTemperatureMaxArray: [], currentYearTemperatureMinArray: [], normalPrecipArray: [], normalTemperatureMaxArray: [],normalTemperatureMinArray: [], currentMonthPrecipArray: [], currentMonthTemperatureMaxArray: [], currentMonthTemperatureMinArray: [], normalMonthPrecipArray: [], normalMonthTemperatureMaxArray: [],normalMonthTemperatureMinArray: [], currentWeekPrecipArray: [], currentWeekTemperatureMaxArray: [], currentWeekTemperatureMinArray: [], normalWeekPrecipArray: [], normalWeekTemperatureMaxArray: [],normalWeekTemperatureMinArray: [],currentYearPrecipDict: [:], currentYearTemperatureMaxDict: [:], currentYearTemperatureMinDict: [:], normalPrecipDict: [:], normalTemperatureMaxDict: [:], normalTemperatureMinDict: [:], precipCumulativeNormal: [:], precipCumulativeThisYear: [:])


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
    
    precipCalc[start] = mainWeatherData.normalPrecipDict[start]! + (mainWeatherData.normalPrecipDict[startMinusOne] ?? 0.0)
    
    // print("end: \(precipCalc)")
    
    
    // increment the date by 1 day
    let dateComponents = NSDateComponents()
    dateComponents.day = 1
    start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendarOptions(rawValue: 0))!
    startMinusOne = gregorian.dateByAddingComponents(dateComponents, toDate: startMinusOne, options: NSCalendarOptions(rawValue: 0))!
    
} while start != end
 
 */



