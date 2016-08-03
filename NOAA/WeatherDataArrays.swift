//
//  TotalRequestPackage.swift
//  NOAA
//
//  Created by Julian Post on 7/30/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

/* struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    } */

import Foundation

struct WeatherDataArrays {

var currentYearPrecipArray, currentYearTemperatureMaxArray, currentYearTemperatureMinArray, lastYearPrecipArray, lastYearTemperatureMaxArray,lastYearTemperatureMinArray: [[String:AnyObject]]

var currentYearPrecipDict, currentYearTemperatureMaxDict, currentYearTemperatureMinDict, lastYearPrecipDict, lastYearTemperatureMaxDict, lastYearTemperatureMinDict: [NSDate : Float]
    
init(currentYearPrecipArray: [[String:AnyObject]], currentYearTemperatureMaxArray: [[String:AnyObject]], currentYearTemperatureMinArray: [[String:AnyObject]], lastYearPrecipArray: [[String:AnyObject]], lastYearTemperatureMaxArray: [[String:AnyObject]],lastYearTemperatureMinArray: [[String:AnyObject]], currentYearPrecipDict: [NSDate : Float], currentYearTemperatureMaxDict: [NSDate : Float], currentYearTemperatureMinDict: [NSDate : Float], lastYearPrecipDict: [NSDate : Float], lastYearTemperatureMaxDict: [NSDate : Float], lastYearTemperatureMinDict: [NSDate : Float]) {
    self.currentYearPrecipDict = currentYearPrecipDict
    self.currentYearTemperatureMaxDict = currentYearTemperatureMaxDict
    self.currentYearTemperatureMinDict = currentYearTemperatureMinDict
    self.lastYearPrecipDict = lastYearPrecipDict
    self.lastYearTemperatureMaxDict = lastYearTemperatureMaxDict
    self.lastYearTemperatureMinDict = lastYearTemperatureMinDict
    
    self.currentYearPrecipArray = currentYearPrecipArray
    self.currentYearTemperatureMaxArray = currentYearTemperatureMaxArray
    self.currentYearTemperatureMinArray = currentYearTemperatureMinArray
    self.lastYearPrecipArray = lastYearPrecipArray
    self.lastYearTemperatureMaxArray = lastYearTemperatureMaxArray
    self.lastYearTemperatureMinArray = lastYearTemperatureMinArray
    }

}

var mainWeatherData = WeatherDataArrays(currentYearPrecipArray: [[:]], currentYearTemperatureMaxArray: [[:]], currentYearTemperatureMinArray: [[:]], lastYearPrecipArray: [[:]], lastYearTemperatureMaxArray: [[:]],lastYearTemperatureMinArray: [[:]], currentYearPrecipDict: [:], currentYearTemperatureMaxDict: [:], currentYearTemperatureMinDict: [:], lastYearPrecipDict: [:], lastYearTemperatureMaxDict: [:], lastYearTemperatureMinDict: [:])