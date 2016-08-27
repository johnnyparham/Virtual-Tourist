//
//  PhotoCell.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/9/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    
    // Using this like the ios-persistence-2.0 step5.5 to cancel
    // previous tasks when a new is set
    //
    var taskToCancelifCellIsReused: NSURLSessionTask? {
        
        didSet {
            if let taskToCancel = oldValue {
                taskToCancel.cancel()
            }
        }
    }
}