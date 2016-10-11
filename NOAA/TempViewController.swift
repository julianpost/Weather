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
    
    //var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    let today = Foundation.Date()
    
    @IBOutlet weak var tempView: UIView!
    
    @IBAction func checkDegs(_ sender: AnyObject) {
        print(mainWeatherData.degreeDayCumulativeNormal)
    }
    
    @IBAction func setNeedsDisplay(_ sender: AnyObject) {
        
        // precipView.setNeedsDisplay()
        // print("button was pressed \(mainWeatherData.lastYearPrecipDict)")
        UpdateView.drawChart(tempView, current: mainWeatherData.degreeDayCumulativeThisYear, normal: mainWeatherData.degreeDayCumulativeNormal)
    }
    
    @IBAction func dismissView(_ sender: AnyObject) {
        
        // Dismiss View Controller
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FetchAllData.temp(tempView)
        
    
        //PrecipView.drawChart(self.tempView, current: mainWeatherData.currentYearTemperatureMaxArray, normal: mainWeatherData.normalTemperatureMaxArray)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
/*    @IBAction func requestStations() {
        
   print(mainWeatherData.normalPrecipDict)              }
    
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
            mainWeatherData.currentYearPrecipArray = TransformArray.toSimple(responseObject)
            mainWeatherData.currentMonthPrecipArray = TransformArray.toCurrentMonth(responseObject)
            mainWeatherData.currentWeekPrecipArray = TransformArray.toCurrentWeek(responseObject)
            print(mainWeatherData.currentYearPrecipArray)
            print(mainWeatherData.currentMonthPrecipArray)
            print(mainWeatherData.currentWeekPrecipArray)
            print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearPrecip)
        //print("currentYearPrecip \(currentYearPrecip.count)")
        
        CallNOAA.requestWeather(currentYearStartDateString, endDate: currentYearEndDateString , dataSet: "GHCND", dataType: "TMAX") { responseObject in
            // use responseObject and error here
            mainWeatherData.currentYearTemperatureMaxDict = responseObject
            mainWeatherData.currentYearTemperatureMaxArray = TransformArray.toSimple(responseObject)
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
            //print(mainWeatherData.normalPrecipArray)
            
            //print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearTemperatureMin)
        //print("currentYearTemperatureMin \(currentYearTemperatureMin.count)")
     
            }
    
    @IBAction func getNormalDLYs() {
        
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
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
            print(mainWeatherData.normalPrecipArray)
            print(mainWeatherData.normalMonthPrecipArray)
            print(mainWeatherData.normalWeekPrecipArray)
            //print(mainWeatherData.normalPrecipArray)
            
            //print("responseObject = \(responseObject)")
            return
        }

        //print(normalPrecip)
        //print("normalPrecip \(normalPrecip.count)")
        
        CallNOAA.requestWeather(normalStartDateString, endDate: normalEndDateString , dataSet: "NORMAL_DLY", dataType: "DLY-TMAX-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalTemperatureMaxDict = responseObject
            mainWeatherData.normalTemperatureMaxArray = TransformArray.toSimple(responseObject)
            mainWeatherData.normalMonthTemperatureMaxArray = TransformArray.toNormalMonth(responseObject)
            mainWeatherData.normalWeekTemperatureMaxArray = TransformArray.toNormalWeek(responseObject)
            print(mainWeatherData.normalTemperatureMaxArray)
            print(mainWeatherData.normalMonthTemperatureMaxArray)
            print(mainWeatherData.normalWeekTemperatureMaxArray)
            //print(mainWeatherData.normalTemperatureMaxArray)
            
            //print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearTemperatureMax)
        //print("normalTemperatureMax \(normalTemperatureMax.count)")
        
        CallNOAA.requestWeather(normalStartDateString, endDate: normalEndDateString , dataSet: "NORMAL_DLY", dataType: "DLY-TMIN-NORMAL") { responseObject in
            // use responseObject and error here
            mainWeatherData.normalTemperatureMinDict = responseObject
            mainWeatherData.normalTemperatureMinArray = TransformArray.toSimple(responseObject)
            //print(mainWeatherData.normalTemperatureMinArray)
            //print("responseObject = \(responseObject)")
            return
        }

        //print(currentYearTemperatureMin)
        //print("normalTemperatureMin \(normalTemperatureMin.count)")
        
        
    }

    @IBAction func checkDictionaries() {
    
        //print(currentYearPrecipDict)
        print(mainWeatherData.currentYearPrecipDict.count)
        //print(currentYearTemperatureMaxDict)
        print(mainWeatherData.currentYearTemperatureMaxDict.count)
        //print(currentYearTemperatureMinDict)
        print(mainWeatherData.currentYearTemperatureMinDict.count)
        //print(normalPrecipDict)
        print(mainWeatherData.normalPrecipDict.count)
        //print(normalTemperatureMaxDict)
        print(mainWeatherData.normalTemperatureMaxDict.count)
        //print(normalTemperatureMinDict)
        print(mainWeatherData.normalTemperatureMinDict.count)
    
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/

}

