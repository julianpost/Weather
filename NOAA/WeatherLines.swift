//
//  WeatherLines.swift
//  NOAA
//
//  Created by Julian Post on 9/14/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit

/*
@IBDesignable class Weatherlines: UIView {
    
    //Weekly sample data
    //var arr:[Float] = mainWeatherData.lastYearTemperatureMaxArray
    
    
    
        
        
        let layerOne = CAShapeLayer()
        let layerTwo = CAShapeLayer()
        
        let width = rect.width
        let height = rect.height
        
        
        //calculate the x point
        
        let margin:CGFloat = 20.0
        var columnXPoint = { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin*2 - 4) /
                CGFloat((mainWeatherData.normalTemperatureMaxArray.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        
        // calculate the y point
        
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = mainWeatherData.normalTemperatureMaxArray.maxElement()!
        var columnYPoint = { (graphPoint:Float) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) /
                CGFloat(maxValue) * graphHeight
            y = graphHeight + topBorder - y // Flip the graph
            return y
        }
        // draw the line graph
        
        // UIColor.blackColor().setFill()
        // UIColor.blackColor().setStroke()
        
        //set up the points line
        var graphPath = UIBezierPath()
        var graphPathTwo = UIBezierPath()
        
        
        //go to start of line
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0),
            y:columnYPoint(mainWeatherData.currentYearTemperatureMaxArray[0])))
        
        graphPathTwo.moveToPoint(CGPoint(x:columnXPoint(0),
            y:columnYPoint(mainWeatherData.normalTemperatureMaxArray[0])))
        
        //add points for each item in the arr array
        //at the correct (x, y) for the point
        for i in 1..<mainWeatherData.currentYearTemperatureMaxArray.count {
            let nextPoint = CGPoint(x:columnXPoint(i),
                                    y:columnYPoint(mainWeatherData.currentYearTemperatureMaxArray[i]))
            
            graphPath.addLineToPoint(nextPoint)
        }
        
        for i in 1..<mainWeatherData.normalTemperatureMaxArray.count {
            
            let nextPointTwo = CGPoint(x:columnXPoint(i),
                                       y:columnYPoint(mainWeatherData.normalTemperatureMaxArray[i]))
            
            graphPathTwo.addLineToPoint(nextPointTwo)
        }
        
        //  graphPath.lineWidth = 2.0
        //  graphPathTwo.lineWidth = 2.0
        //  graphPath.stroke()
        //  graphPathTwo.stroke()
        
        
        //layerOne.position = CGPoint(x:columnXPoint(0),
        //                       y:columnYPoint(mainWeatherData.currentYearTemperatureMaxArray[0]))
        //layerTwo.position = CGPoint(x:columnXPoint(0),
        //                       y:columnYPoint(mainWeatherData.currentYearTemperatureMaxArray[0]))
        
        
        layerOne.path = graphPath.CGPath
        layerTwo.path = graphPathTwo.CGPath
        
        layerOne.lineWidth = 2.0
        layerTwo.lineWidth = 2.0
        
        layerOne.strokeColor = UIColor.blackColor().CGColor
        layerTwo.strokeColor = UIColor.blackColor().CGColor
        
        layerOne.fillColor = nil
        layerTwo.fillColor = nil
        
        self.layer.addSublayer(layerOne)
        self.layer.addSublayer(layerTwo)
        //self.layer.insertSublayer(layerOne, atIndex: 0)
        //self.layer.insertSublayer(layerTwo, atIndex: 0)
    
}
 
 */