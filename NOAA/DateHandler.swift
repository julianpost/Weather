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
    
    let todayGlobal = NSDate()


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

    
    var currentYearStart, currentYearEnd, currentMonthStart, currentMonthEnd, currentWeekStart, currentWeekEnd, normalYearStart, normalYearEnd, normalMonthStart, normalMonthEnd, normalWeekStart, normalWeekEnd: NSDate
    
    init(currentYearStart: NSDate, currentYearEnd: NSDate, currentMonthStart: NSDate, currentMonthEnd: NSDate, currentWeekStart: NSDate, currentWeekEnd: NSDate, normalYearStart: NSDate, normalYearEnd: NSDate, normalMonthStart: NSDate, normalMonthEnd: NSDate, normalWeekStart: NSDate, normalWeekEnd: NSDate) {
        

        func currentYearStartMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.month = 1
            todaysDateComponents.day = 1
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
            
        }
        
        func currentYearEndMath(todaysDate: NSDate) -> NSDate {
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let endDate = today
            return endDate
        }
        
        func currentMonthStartMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.day = 1
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
            
        }
        
        func currentMonthEndMath(todaysDate: NSDate) -> NSDate {
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let endDate = today
            return endDate
        }
        
        func currentWeekStartMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.day -= 7
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
            
        }
        
        func currentWeekEndMath(todaysDate: NSDate) -> NSDate {
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let endDate = today
            return endDate
        }
        
        
        func lastYearStartMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.year -= 1
            todaysDateComponents.month = 1
            todaysDateComponents.day = 1
            
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
        }
        
        
        func lastYearEndMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.year -= 1
            todaysDateComponents.month = 12
            todaysDateComponents.day = 31
            
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
            
        }
        
        func normalYearStartMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.year = 2010
            todaysDateComponents.month = 1
            todaysDateComponents.day = 1
            
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
        }
        
        
        func normalYearEndMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.year = 2010
            todaysDateComponents.month = 12
            todaysDateComponents.day = 31
            
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
            
        }
        
        
        func normalMonthStartMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.year = 2010
            todaysDateComponents.day = 1
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
            
        }
        
        func normalMonthEndMath(todaysDate: NSDate) -> NSDate {
            
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
        
        func normalWeekStartMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.year = 2010
            todaysDateComponents.day -= 7
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
            
        }
        
        func normalWeekEndMath(todaysDate: NSDate) -> NSDate {
            
            let userCalendar = NSCalendar.currentCalendar()
            
            let today = NSCalendar.currentCalendar().startOfDayForDate(todaysDate)
            
            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day]
            
            let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: today)
            
            todaysDateComponents.year = 2010
            
            
            return userCalendar.dateFromComponents(todaysDateComponents)!
        }
    
        
        self.currentYearStart = currentYearStartMath(todayGlobal)
        self.currentYearEnd = currentYearEndMath(todayGlobal)
        self.currentMonthStart = currentMonthStartMath(todayGlobal)
        self.currentMonthEnd = currentMonthEndMath(todayGlobal)
        self.currentWeekStart = currentWeekStartMath(todayGlobal)
        self.currentWeekEnd = currentWeekEndMath(todayGlobal)
        self.normalYearStart = normalYearStartMath(todayGlobal)
        self.normalYearEnd = normalYearEndMath(todayGlobal)
        self.normalMonthStart = normalMonthStartMath(todayGlobal)
        self.normalMonthEnd = normalMonthEndMath(todayGlobal)
        self.normalWeekStart = normalWeekStartMath(todayGlobal)
        self.normalWeekEnd = normalWeekEndMath(todayGlobal)
        
    

    }

}

var dates = Date()
