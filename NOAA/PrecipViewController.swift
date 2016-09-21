//
//  PrecipViewController.swift
//  NOAA
//
//  Created by Julian Post on 8/6/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit


class PrecipViewController: UIViewController {
    
    
    @IBAction func setNeedsDisplay(sender: AnyObject) {
        
       // precipView.setNeedsDisplay()
       // print("button was pressed \(mainWeatherData.lastYearPrecipDict)")
        PrecipView.drawChart(precipView, current: mainWeatherData.currentYearPrecipArray, normal: mainWeatherData.normalPrecipArray)
    }
    
    @IBOutlet weak var precipView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    //    precipView.setNeedsDisplay()
        
        FetchAllData.precip()
        
        PrecipView.drawChart(self.precipView, current: mainWeatherData.currentMonthPrecipArray, normal: mainWeatherData.normalMonthPrecipArray)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}