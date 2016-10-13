//
//  PrecipViewController.swift
//  NOAA
//
//  Created by Julian Post on 8/6/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit


class PrecipViewController: UIViewController {
    
    
    @IBOutlet weak var precipView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchAllData.precip(precipView)
        
        //UpdateView.drawChart(self.precipView, current: mainWeatherData.currentMonthPrecipArray, normal: mainWeatherData.normalMonthPrecipArray)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
