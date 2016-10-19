//
//  SettingsViewController.swift
//  NOAA
//
//  Created by Julian Post on 10/16/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import Foundation
import UIKit


class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tblResults: UITableView!
    
    @IBOutlet weak var zipField: UITextField!
    
    @IBOutlet weak var minTempOne: UISlider!
    @IBOutlet weak var maxTempOne: UISlider!
    @IBOutlet weak var minTempTwo: UISlider!
    @IBOutlet weak var maxTempTwo: UISlider!
    @IBOutlet weak var minTempThree: UISlider!
    @IBOutlet weak var maxTempThree: UISlider!
    
    @IBOutlet weak var minTempOneLbl: UILabel!
    @IBOutlet weak var maxTempOneLbl: UILabel!
    @IBOutlet weak var minTempTwoLbl: UILabel!
    @IBOutlet weak var maxTempTwoLbl: UILabel!
    @IBOutlet weak var minTempThreeLbl: UILabel!
    @IBOutlet weak var maxTempThreeLbl: UILabel!
    
    
    
    @IBAction func minTempOneChanged() {
        mainSettingsData.minTempOne = Int(minTempOne.value)
        minTempOneLbl.text = "\(mainSettingsData.minTempOne)"
    }
    
    @IBAction func maxTempOneChanged() {
        mainSettingsData.maxTempOne = Int(maxTempOne.value)
        maxTempOneLbl.text = "\(mainSettingsData.maxTempOne)"
        
    }
    
    @IBAction func minTempTwoChanged() {
        mainSettingsData.minTempTwo = Int(minTempTwo.value)
        minTempTwoLbl.text = "\(mainSettingsData.minTempTwo)"
    }
    
    @IBAction func maxTempTwoChanged() {
        mainSettingsData.maxTempTwo = Int(maxTempTwo.value)
        maxTempTwoLbl.text = "\(mainSettingsData.maxTempTwo)"
    }
    
    @IBAction func minTempThreeChanged() {
        mainSettingsData.minTempThree = Int(minTempThree.value)
        minTempThreeLbl.text = "\(mainSettingsData.minTempThree)"
    }
    
    @IBAction func maxTempThreeChanged() {
        mainSettingsData.maxTempThree = Int(maxTempThree.value)
        maxTempThreeLbl.text = "\(mainSettingsData.maxTempThree)"
    }
    
    
    @IBAction func zipFieldAction(_ sender: AnyObject) {
        loadListOfLocations()
        //tblResults.reloadData()
    }
    //var dataArray = [String]()
    
    //var filteredArray = [String]()
    
    var shouldShowSearchResults = false
    
    var searchController: UISearchController!
    
    //var customSearchController: CustomSearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       //tblResults.delegate = self
       //tblResults.dataSource = self
        
        self.tblResults.register(UITableViewCell.self, forCellReuseIdentifier: "idCell")
        
        minTempOne.value = Float(mainSettingsData.minTempOne)
        maxTempOne.value = Float(mainSettingsData.maxTempOne)
        
        minTempTwo.value = Float(mainSettingsData.minTempTwo)
        maxTempTwo.value = Float(mainSettingsData.maxTempTwo)
        
        minTempThree.value = Float(mainSettingsData.minTempThree)
        maxTempThree.value = Float(mainSettingsData.maxTempThree)
        
        minTempOneLbl.text = "\(mainSettingsData.minTempOne)"
        maxTempOneLbl.text = "\(mainSettingsData.maxTempOne)"
        
        minTempTwoLbl.text = "\(mainSettingsData.minTempTwo)"
        maxTempTwoLbl.text = "\(mainSettingsData.maxTempTwo)"
        
        minTempThreeLbl.text = "\(mainSettingsData.minTempThree)"
        maxTempThreeLbl.text = "\(mainSettingsData.maxTempThree)"
    
        
        loadListOfLocations()
        
        // Uncomment the following line to enable the default search controller.
        // configureSearchController()
        
        // Comment out the next line to disable the customized search controller and search bar and use the default ones. Also, uncomment the above line.
        //configureCustomSearchController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UITableView Delegate and Datasource functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return mainSettingsData.stationsArray.count
        }
        else {
            return mainSettingsData.stationsArray.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        
        if shouldShowSearchResults {
            cell.textLabel?.text = mainSettingsData.stationsArray[(indexPath as NSIndexPath).row]
        }
        else {
            cell.textLabel?.text = mainSettingsData.stationsArray[(indexPath as NSIndexPath).row]
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
    // MARK: Custom functions
    
    func loadListOfLocations() {
        
        CallForLocations.requestLocations(dateFor.stringOfNormalYearStart, endDate: dateFor.stringOfNormalYearEnd, dataSet: "GHCND", dataType: "PRCP", zipCode: zipField.text ?? "")  { responseObject in
            // use responseObject and error here
            print(responseObject)
            //mainSettingsData.stationsArray = responseObject
            
            
            return
        }
        
        print(mainSettingsData.stationsArray)
        
        }
}
