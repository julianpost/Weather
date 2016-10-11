//
//  ArrayCalculations.swift
//  NOAA
//
//  Created by Julian Post on 8/28/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation

class TransformArray {
    
  
    static func toSimple(_ dictionary: [Foundation.Date:Float]) -> [Float] {
        
        let sortedArray = dictionary.sorted { $0.0.compare($1.0) == .orderedAscending }
        
        var arr: [Float] = []
        for (_,value) in sortedArray {
            
            arr.append(value)
            
        }
        return arr

    }
    
    
    static func toCurrentMonth(_ dictionary: [Foundation.Date:Float]) -> [Float] {
    
        var arr: [Float] = []
        let today = Foundation.Date()
        let gregorian: Calendar! = Calendar(identifier: Calendar.Identifier.gregorian)
        
        var start = Date.currentMonthStartMath(today)
        let end = Date.currentMonthEndMath(today)
        
        while start.compare(end) != ComparisonResult.OrderedSame {
            var counter = 0
            
            if let value = dictionary[start] {
                
                //arr[counter] = value
                arr.insert(value, atIndex: counter)
            }
            
            // increment the date by 1 day
            var dateComponents = DateComponents()
            dateComponents.day = 1
            start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendar.Options(rawValue: 0))!
            
            // increment the counter by 1
            
            counter += 1
        }

    
        return arr
    }
    
    static func toCurrentWeek(_ dictionary: [Foundation.Date:Float]) -> [Float] {
        
        var arr: [Float] = []
        let today = Foundation.Date()
        let gregorian: Calendar! = Calendar(identifier: Calendar.Identifier.gregorian)
        
        var start = Date.currentWeekStartMath(today)
        let end = Date.currentWeekEndMath(today)
        
        //print("start\(start)")
        //print("end\(end)")
        
        while start.compare(end) != ComparisonResult.OrderedSame {
            var counter = 0
            
            if let value = dictionary[start] {
                
                //print("value\(value)")
                
                //arr[counter] = value
                arr.insert(value, atIndex: counter)
            }
            
            // increment the date by 1 day
            var dateComponents = DateComponents()
            dateComponents.day = 1
            start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendar.Options(rawValue: 0))!
            
            // increment the counter by 1
            
            counter += 1
        }
        
        
        return arr
    }
    
    static func toNormalMonth(_ dictionary: [Foundation.Date:Float]) -> [Float] {
        
        var arr: [Float] = []
        let today = Foundation.Date()
        let gregorian: Calendar! = Calendar(identifier: Calendar.Identifier.gregorian)
        
        var start = Date.normalMonthStartMath(today)
        let end = Date.normalMonthEndMath(today)
        
        //print(start)
        //print(end)
        
        while start.compare(end) != ComparisonResult.OrderedSame {
            var counter = 0
            
            if let value = dictionary[start] {
                
                //arr[counter] = value
                arr.insert(value, atIndex: counter)
            }
            
            // increment the date by 1 day
            var dateComponents = DateComponents()
            dateComponents.day = 1
            start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendar.Options(rawValue: 0))!
            
            // increment the counter by 1
            
            counter += 1
        }
        
        
        return arr
    }
    
    static func toNormalWeek(_ dictionary: [Foundation.Date:Float]) -> [Float] {
        
        var arr: [Float] = []
        let today = Foundation.Date()
        let gregorian: Calendar! = Calendar(identifier: Calendar.Identifier.gregorian)
        
        var start = Date.normalWeekStartMath(today)
        let end = Date.normalWeekEndMath(today)
        
        //print("start\(start)")
        //print("end\(end)")
        
        while start.compare(end) != ComparisonResult.OrderedSame {
            var counter = 0
            
            if let value = dictionary[start] {
                
                //print("value\(value)")
                
                //arr[counter] = value
                arr.insert(value, atIndex: counter)
            }
            
            // increment the date by 1 day
            var dateComponents = DateComponents()
            dateComponents.day = 1
            start = gregorian.dateByAddingComponents(dateComponents, toDate: start, options: NSCalendar.Options(rawValue: 0))!
            
            // increment the counter by 1
            
            counter += 1
        }
        
        
        return arr
    }
    
    static func toDegreeDay(_ baseTemp: Float, maxTemp: Float, tMin: [Float], tMax: [Float]) -> [Float] {
        
        var degreeDay: [Float] = []
        
            for i in 0...tMin.count-1 {
        
                if tMin[i] < baseTemp && tMax[i] > maxTemp {
            degreeDay.append((baseTemp + maxTemp)/2 - baseTemp)
                }
            
                else if tMin[i] < baseTemp {
            degreeDay.append((baseTemp + tMax[i])/2 - baseTemp)
                }
            
                else if tMax[i] > maxTemp {
            degreeDay.append((tMin[i] + maxTemp)/2 - baseTemp)
                }
            
                else {
            degreeDay.append((tMin[i] + tMax[i])/2 - baseTemp)
                }
            
        }
        
        for i in 0...degreeDay.count-1 {
            if degreeDay[i] < 0 {
                degreeDay[i] = 0
            }
        }
        
        return degreeDay
        
    }
    
    static func toCumulative(_ array: [Float]) -> [Float] {
        
        var newArray: [Float] = [array[0]]
    
        for i in 1...array.count-1 {
            
            newArray.append(newArray[i-1] + array[i])
        
        }
        return newArray
    }

}






   /*
        
        let today = NSDate()
        let gregorian: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        var precipCalc:[NSDate : Float] = [:]
        var start = Date.lastYearStartMath(today)
        var startMinusOne = Date.lastYearStartMath(today)
        var end = Date.lastYearEndMath(today)
                
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



