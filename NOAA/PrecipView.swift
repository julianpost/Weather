//
//  PrecipView.swift
//  NOAA
//
//  Created by Julian Post on 8/4/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit

@IBDesignable class PrecipView: UIView {
    
    //Weekly sample data
    //var arr:[Float] = mainWeatherData.lastYearTemperatureMaxArray
    

    
    override func drawRect(rect: CGRect) {
        
       // makeArray()
       // print(arr)
       // print(mainWeatherData.lastYearTemperatureMaxArray)
       
     //   let today = NSDate()
     //   let formatter = NSDateFormatter()
     //   formatter.dateFormat = "yyyy-MM-dd"
     //   let gregorian: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
      //  let currentYearStartDate = Date.currentYearStartMath(today)
      //  let currentYearEndDate = Date.currentYearEndMath(today)
      //  let lastYearStartDate = Date.lastYearStartMath(today)
      //  let lastYearEndDate = Date.lastYearEndMath(today)
        
        let width = rect.width
        let height = rect.height
        
        //set up background clipping area
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: UIRectCorner.AllCorners,
                                cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        //2 - get the current context
    //    let context = UIGraphicsGetCurrentContext()
       // let colors = [startColor.CGColor, endColor.CGColor]
        
        //3 - set up the color space
     //   let colorSpace = CGColorSpaceCreateDeviceRGB()
        

 
 
        //calculate the x point
        
        let margin:CGFloat = 20.0
        var columnXPoint = { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin*2 - 4) /
                CGFloat((mainWeatherData.lastYearTemperatureMaxArray.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        
        // calculate the y point
        
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = mainWeatherData.lastYearTemperatureMaxArray.maxElement()!
        var columnYPoint = { (graphPoint:Float) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) /
                CGFloat(maxValue) * graphHeight
            y = graphHeight + topBorder - y // Flip the graph
            return y
        }
        // draw the line graph
        
        UIColor.blackColor().setFill()
        UIColor.blackColor().setStroke()
        
        //set up the points line
        var graphPath = UIBezierPath()
        //go to start of line
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0),
            y:columnYPoint(mainWeatherData.lastYearTemperatureMaxArray[0])))
        
        //add points for each item in the arr array
        //at the correct (x, y) for the point
        for i in 1..<mainWeatherData.lastYearTemperatureMaxArray.count {
            let nextPoint = CGPoint(x:columnXPoint(i),
                                    y:columnYPoint(mainWeatherData.lastYearTemperatureMaxArray[i]))
            graphPath.addLineToPoint(nextPoint)
        }
        
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        
    }
}