//
//  ViewController.swift
//  NOAA
//
//  Created by Julian Post on 7/24/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tempView: UIView!
    
    
    @IBAction func dismissView(_ sender: AnyObject) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchAllData.temp(tempView)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

