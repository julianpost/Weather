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
        
      /*  CallForLocations.requestLocationCategories(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd, dataSet: "GHCND", dataType: "PRCP")  { responseObject in
            // use responseObject and error here
            print(responseObject)
           
            
            return
        }*/
        
        /*CallForLocations.requestLocations(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd, dataSet: "GHCND", dataType: "PRCP", zipCode: "05401")  { responseObject in
            // use responseObject and error here
            print(responseObject)
            
            
            return
        }*/

        
        //UpdateView.drawChart(self.precipView, current: mainWeatherData.currentMonthPrecipArray, normal: mainWeatherData.normalMonthPrecipArray)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
