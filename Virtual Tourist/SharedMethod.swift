//
//  SharedMethod.swift
//  Virtual Tourist
//
//  Created by Johnny Parham on 8/28/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

class SharedMethod {
    
    
    // Shared instance constants used to improve readability in methods
    
    static let  errorMessage                    =   SharedServices.sharedInstance.errorMessage
    static let  presentingVC                    =   SharedServices.sharedInstance.presentingVC
    static let  showAlert                       =   SharedServices.sharedInstance.showAlert
    static let  sharedContext                   =   CoreDataStackManager.sharedInstance.managedObjectContext
    static let  setActivityIndicator            =   SharedServices.sharedInstance.setActivityIndicator
    static let  saveContext                     =   CoreDataStackManager.sharedInstance.saveContext
    
    
}