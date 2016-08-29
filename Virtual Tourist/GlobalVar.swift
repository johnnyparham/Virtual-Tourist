//
//  GlobalVar.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/28/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import Foundation


// used to store vars used in many classes
class GlobalVar: NSObject {
    static let sharedInstance = GlobalVar()    // set up shared instance class
    private override init() {}
    
    
    var photosDownloadIsInProcess = false
    
    
}