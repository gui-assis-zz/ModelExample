//
//  Model.swift
//
//  Created by Guilherme Assis on 24/01/16.
//

import Foundation
import CoreData

public class Model: NSManagedObject {
    
    //MARK: - Constructor
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    //MARK: - Get
    public class func getAll() -> [Model] {
        return getWithPropertiesToFetch("", predicate: "")
    }
    
    public class func getWithPredicate(predicate: String) -> [Model] {
        return getWithPropertiesToFetch("", predicate: predicate)
    }
    
    public class func getWithPropertiesToFetch(propertiesToFetch: String, predicate: String) -> [Model] {
        let request = fetchRequestWithPropertiesToFetch(propertiesToFetch, predicate: predicate, andFetchLimit: 20)
        
        do {
            let result = try AppHelper.mainManagedObjectContext().executeFetchRequest(request)
            return result as! [Model]
        } catch {
            return NSArray() as! [Model]
        }
    }
    
    public class func fetchRequestWithPropertiesToFetch(propertiesToFetch: String, predicate: String, andFetchLimit: NSInteger) -> NSFetchRequest {
        
        let request = NSFetchRequest()
        let entity  = NSEntityDescription.entityForName(String(self), inManagedObjectContext: AppHelper.mainManagedObjectContext())
        
        request.entity = entity
        request.propertiesToFetch = propertiesToFetchForString(propertiesToFetch)
        request.predicate = predicateForStringWithFormat(predicate)
        
        return request
    }
    
    //MARK: - Save
    public class func saveAll(){
        do {
            try AppHelper.mainManagedObjectContext().save()
        } catch {
            
        }
    }
    
    public func save(){
        do {
            try AppHelper.mainManagedObjectContext().save()
        } catch {
            
        }
    }
    
    //MARK: - Delete
    public func delete(){
        do {
            AppHelper.mainManagedObjectContext().deleteObject(self)
            try AppHelper.mainManagedObjectContext().save()
        } catch {
            
        }
    }
    
    public class func deleteWithPredicate(predicate: String) {
        let allObjs = getWithPredicate(predicate)
        for model: Model in allObjs {
            AppHelper.mainManagedObjectContext().deleteObject(model)
        }
        do {
            try AppHelper.mainManagedObjectContext().save()
        } catch {
            
        }
    }
    
    //MARK: - RollBack
    public class func rollback() {
        AppHelper.mainManagedObjectContext().rollback()
    }
    
    //MARK: - Truncate
    public class func truncate() {
        let allObjs = getAll()
        for model: Model in allObjs {
            AppHelper.mainManagedObjectContext().deleteObject(model)
        }
        
        do {
            try AppHelper.mainManagedObjectContext().save()
        } catch {
            
        }
    }
    
    //MARK: - Private Methods
    class func propertiesToFetchForString(stringPropertiesToFetch: String) -> [AnyObject]? {
        if !(stringPropertiesToFetch == "") {
            let propertiesToFetch: [AnyObject] = stringPropertiesToFetch.stringByReplacingOccurrencesOfString(" ", withString: "").componentsSeparatedByString(",")
            return propertiesToFetch
        }
        return nil
    }
    
    class func predicateForStringWithFormat(stringWithFormatPredicate: String) -> NSPredicate? {
        if !(stringWithFormatPredicate == ""){
            return NSPredicate(format: stringWithFormatPredicate, argumentArray: nil)
        }
        return nil
    }
}
