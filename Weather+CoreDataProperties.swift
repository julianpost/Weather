//
//  Weather+CoreDataProperties.swift
//  NOAA
//
//  Created by Julian Post on 7/27/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Weather {

    @NSManaged var dataSetID: String?
    @NSManaged var date: Foundation.Date?
    @NSManaged var precip: NSNumber?
    @NSManaged var temperatureMax: NSNumber?
    @NSManaged var temperatureMin: NSNumber?

}
