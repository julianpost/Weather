//
//  FileRequests.swift
//  NOAA
//
//  Created by Julian Post on 7/26/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation
import CoreData

class FileRequests {

    static func saveRequestedWeather(managedObjectContext: NSManagedObjectContext, startingDateInput: NSDate, endingDateInput: NSDate, dataSetID: String) {
        
        let precip = OrganizeRequests.precipDictToArray()
        let temperatureMax = OrganizeRequests.temperatureMaxDictToArray()
        let temperatureMin = OrganizeRequests.temperatureMinDictToArray()
        
        print(precip)
        
        let newWeatherEntity = NSEntityDescription.entityForName("Weather", inManagedObjectContext: managedObjectContext)
        
        // Initialize Record
        let record = Weather(entity: newWeatherEntity!, insertIntoManagedObjectContext: managedObjectContext)
        
        // Populate Record
        
        // Set "date" to equal the current day
        // let today = NSDate()
        
        
        let gregorian:NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
       /* let startingDateComponents = NSDateComponents()
        startingDateComponents.year = year
        startingDateComponents.month = 1
        startingDateComponents.day = 1
        
        let endingDateComponents = NSDateComponents()
        endingDateComponents.year = year
        endingDateComponents.month = 12
        endingDateComponents.day = 31
        
        var startingDate: NSDate! = gregorian.dateFromComponents(startingDateComponents)
        print(startingDate)
        
        let endingDate: NSDate! = gregorian.dateFromComponents(endingDateComponents)
        print(endingDate)
        
        // Loop through each date until the ending date is
        // reached
 
 */
        
        var startingDate = startingDateInput
        let endingDate = endingDateInput
        
        while startingDate.compare(endingDate) != NSComparisonResult.OrderedSame {
            
            print(startingDate)
            
            record.date = startingDate
            record.dataSetID = dataSetID
            
            if let value = precip[startingDate] {
                record.precip = value
            }
            
            if let value = temperatureMax[startingDate] {
                record.temperatureMax = value
            }
            
            if let value = temperatureMin[startingDate] {
                record.temperatureMin = value
            }
            
            
            // increment the date by 1 day
            let dateComponents = NSDateComponents()
            dateComponents.day = 1
            startingDate = gregorian.dateByAddingComponents(dateComponents, toDate: startingDate, options: NSCalendarOptions(rawValue: 0))!
        }
        
        
        
        
        
    }
    
    

}