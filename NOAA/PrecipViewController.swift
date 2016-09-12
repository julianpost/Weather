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
        
        precipView.setNeedsDisplay()
       // print("button was pressed \(mainWeatherData.lastYearPrecipDict)")
        
    }
    
    @IBOutlet weak var precipView: PrecipView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    //    precipView.setNeedsDisplay()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}