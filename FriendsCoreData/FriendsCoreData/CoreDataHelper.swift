//
//  CoreDataHelper.swift
//  FriendsCoreData
//
//  Created by Rinni Swift on 4/20/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    
    static var context: NSManagedObjectContext {
        // create an NSManagedObjectContext to act as our scratchpad for us to work with objects
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    static func saveFriend(name: String) -> Friend {
        // create a Friend object from the name and call saveContext to save to core data
        let entity = NSEntityDescription.entity(forEntityName: "Friend", in: context)!
        let friend = NSManagedObject(entity: entity, insertInto: context) as! Friend
        friend.setValue(name, forKey: "name")
        saveContext()
        return friend
    }
    
    static func saveContext() {
        // save context from the NSManagedObjectContext 
        do {
            try context.save()
        } catch let error as NSError {
            print("could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    static func retrieveFriends() -> [Friend] {
        do {
            let fetchRequest = NSFetchRequest<Friend>(entityName: "Friend")
            let result = try context.fetch(fetchRequest)
            
            return result
        } catch let error as NSError {
            print("could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    static func delete(object: Friend) {
        context.delete(object)
        saveContext()
    }
    
}
