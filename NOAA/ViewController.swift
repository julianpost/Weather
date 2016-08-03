//
//  ViewController.swift
//  NOAA
//
//  Created by Julian Post on 7/24/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
    var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    let today = NSDate()
    
    @IBAction func requestStations() {
        
   print(mainWeatherData.lastYearPrecipDict)              }
    
    @IBAction func getCurrentYearDLYs() {
        
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let currentYearStartDate = Date.currentYearStartMath(today)
        let currentYearEndDate = Date.currentYearEndMath(today)
        
        let currentYearStartDateString = formatter.stringFromDate(currentYearStartDate)
        let currentYearEndDateString = formatter.stringFromDate(currentYearEndDate)
       
        print("currentYearStartDateString \(currentYearStartDateString)")
        print("currentYearEndDateString \(currentYearEndDateString)")
        
        CallNOAA.requestWeather(currentYearStartDateString, endDate: currentYearEndDateString , dataSet: "GHCND", dataType: "PRCP") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearPrecipDict = responseObject
            //print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearPrecip)
        //print("currentYearPrecip \(currentYearPrecip.count)")
        
        CallNOAA.requestWeather(currentYearStartDateString, endDate: currentYearEndDateString , dataSet: "GHCND", dataType: "TMAX") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMaxDict = responseObject
            //print("responseObject = \(responseObject)")
            return
    }

        //print(currentYearTemperatureMax)
        //print("currentYearTemperatureMax \(currentYearTemperatureMax.count)")
        
        CallNOAA.requestWeather(currentYearStartDateString, endDate: currentYearEndDateString , dataSet: "GHCND", dataType: "TMIN") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMinDict = responseObject
            //print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearTemperatureMin)
        //print("currentYearTemperatureMin \(currentYearTemperatureMin.count)")
     
            }
    
    @IBAction func getLastYearDLYs() {
        
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let lastYearStartDate = Date.lastYearStartMath(today)
        let lastYearEndDate = Date.lastYearEndMath(today)
        
        let lastYearStartDateString = formatter.stringFromDate(lastYearStartDate)
        let lastYearEndDateString = formatter.stringFromDate(lastYearEndDate)
        
        print("lastYearStartDateString \(lastYearStartDateString)")
        print("lastYearEndDateString \(lastYearEndDateString)")
        
        
        CallNOAA.requestWeather(lastYearStartDateString, endDate: lastYearEndDateString , dataSet: "GHCND", dataType: "PRCP") { responseObject in
            // use responseObject and error here
            mainWeatherData.lastYearPrecipDict = responseObject
            //print("responseObject = \(responseObject)")
            return
        }

        //print(lastYearPrecip)
        //print("lastYearPrecip \(lastYearPrecip.count)")
        
        CallNOAA.requestWeather(lastYearStartDateString, endDate: lastYearEndDateString , dataSet: "GHCND", dataType: "TMAX") { responseObject in
            // use responseObject and error here
            mainWeatherData.lastYearTemperatureMaxDict = responseObject
            //print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearTemperatureMax)
        //print("lastYearTemperatureMax \(lastYearTemperatureMax.count)")
        
        CallNOAA.requestWeather(lastYearStartDateString, endDate: lastYearEndDateString , dataSet: "GHCND", dataType: "TMIN") { responseObject in
            // use responseObject and error here
            mainWeatherData.lastYearTemperatureMinDict = responseObject
            //print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearTemperatureMin)
        //print("lastYearTemperatureMin \(lastYearTemperatureMin.count)")
        
    }

    @IBAction func checkDictionaries() {
    
        //print(currentYearPrecipDict)
        print(mainWeatherData.currentYearPrecipDict.count)
        //print(currentYearTemperatureMaxDict)
        print(mainWeatherData.currentYearTemperatureMaxDict.count)
        //print(currentYearTemperatureMinDict)
        print(mainWeatherData.currentYearTemperatureMinDict.count)
        //print(lastYearPrecipDict)
        print(mainWeatherData.lastYearPrecipDict.count)
        //print(lastYearTemperatureMaxDict)
        print(mainWeatherData.lastYearTemperatureMaxDict.count)
        //print(lastYearTemperatureMinDict)
        print(mainWeatherData.lastYearTemperatureMinDict.count)
    
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

