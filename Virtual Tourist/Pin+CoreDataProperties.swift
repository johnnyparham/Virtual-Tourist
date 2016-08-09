//
//  Pin+CoreDataProperties.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/8/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import Foundation
import CoreData

extension Pin {
    
    @NSManaged var longitude: Double
    @NSManaged var latitude: Double
    @NSManaged var pageNumber: NSNumber?
    @NSManaged var photos: NSSet?
    @NSManaged var pinTitle: String?
    
}
