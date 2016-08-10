//
//  Photos+CoreDataProperties.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/10/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import Foundation
import CoreData

extension Photos {
    
    @NSManaged var url: String?
    @NSManaged var id: String?
    @NSManaged var filePath: String?
    @NSManaged var title: String?
    @NSManaged var pin: Pin?
}
