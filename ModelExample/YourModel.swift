//
//  YourModel.swift
//  ModelExample
//
//  Created by Guilherme Assis on 25/01/16.
//  Copyright © 2016 Guilherme Assis. All rights reserved.
//

import Foundation
import CoreData

class YourModel: Model {
    init() {
        let entityDescription = NSEntityDescription.entityForName("YourModel", inManagedObjectContext: AppHelper.mainManagedObjectContext())
        super.init(entity: entityDescription!, insertIntoManagedObjectContext: AppHelper.mainManagedObjectContext())
    }
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        let entityDescription = NSEntityDescription.entityForName("YourModel", inManagedObjectContext: AppHelper.mainManagedObjectContext())
        super.init(entity: entityDescription!, insertIntoManagedObjectContext: AppHelper.mainManagedObjectContext())
    }
    
    override var description: String {
        return "ID: \(self.id)\nName: \(self.name)\nDate: \(self.date)"
    }
}


extension YourModel {
    @NSManaged var name: String?
    @NSManaged var id: NSNumber?
    @NSManaged var date: NSDate?
}
