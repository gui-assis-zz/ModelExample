//
//  AppHelper.swift
//  ModelExample
//
//  Created by Guilherme Assis on 25/01/16.
//  Copyright © 2016 Guilherme Assis. All rights reserved.
//

import UIKit
import CoreData

class AppHelper: NSObject {
    
    class func mainManagedObjectContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
}
