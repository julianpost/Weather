//
//  DateHandler.swift
//  NOAA
//
//  Created by Julian Post on 7/26/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation
import UIKit

class Date {


    static func stringToNSDate(string: String) -> NSDate {
    var date: NSDate
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    date = dateFormatter.dateFromString(string)!
      //  print("before \(date)")
  //  date = NSCalendar.currentCalendar().startOfDayForDate(date)
      //  print("after \(date)")
    
    return date
        
        
    }
    
    static func currentYearStartMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.month = 1
        todaysDateComponents.day = 1
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
        
    }
        
    static func currentYearEndMath(todaysDate: NSDate) -> NSDate {
            
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
        let endDate = today
        return endDate
    }
    
    static func currentMonthStartMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.day = 1
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
        
    }
    
    static func currentMonthEndMath(todaysDate: NSDate) -> NSDate {
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let endDate = today
        return endDate
    }
    
    static func currentWeekStartMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.day -= 7
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
        
    }
    
    static func currentWeekEndMath(todaysDate: NSDate) -> NSDate {
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let endDate = today
        return endDate
    }
    
    
    static func lastYearStartMath(todaysDate: NSDate) -> NSDate {
            
        let userCalendar = NSCalendar.currentCalendar()
            
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
        todaysDateComponents.year -= 1
        todaysDateComponents.month = 1
        todaysDateComponents.day = 1
            
            
        return userCalendar.dateFromComponents(todaysDateComponents)!
    }
        
        
    static func lastYearEndMath(todaysDate: NSDate) -> NSDate {
            
        let userCalendar = NSCalendar.currentCalendar()
            
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
        todaysDateComponents.year -= 1
        todaysDateComponents.month = 12
        todaysDateComponents.day = 31
            
            
        return userCalendar.dateFromComponents(todaysDateComponents)!
        
    }
    
    static func normalStartMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.year = 2010
        todaysDateComponents.month = 1
        todaysDateComponents.day = 1
        
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
    }
    
    
    static func normalEndMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.year = 2010
        todaysDateComponents.month = 12
        todaysDateComponents.day = 31
        
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
        
    }
    
    
    static func normalMonthStartMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.year = 2010
        todaysDateComponents.day = 1
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
        
    }
    
    static func normalMonthEndMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.year = 2010
        todaysDateComponents.month += 1
        todaysDateComponents.day = 1
        todaysDateComponents.day -= 1
        
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
    }
    
    static func normalWeekStartMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.year = 2010
        todaysDateComponents.day -= 7
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
        
    }
    
    static func normalWeekEndMath(todaysDate: NSDate) -> NSDate {
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
        
        let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
        
        let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
        
        todaysDateComponents.year = 2010
        
        
        return userCalendar.dateFromComponents(todaysDateComponents)!
    }
    

}
