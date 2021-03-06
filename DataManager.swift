//
//  DataManager.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/9/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import Foundation
import CoreData


struct DataManager {
    

    static let sharedManager = DataManager()
    
    let coreDataManager : CoreDataManager = CoreDataManager()
    
    func loadContacts() -> [Contact]? {
        
        let query = NSFetchRequest(entityName: "Contact")
        
        do {
            if let results = try self.coreDataManager.context.executeFetchRequest(query) as? [Contact]{
                
                return results
            }
        } catch {
            
            print("Failed to query Contacts: \(error)")
        }
        
        return [Contact]()
    }
    
    private func filePathForArchiving() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = "\(documentsPath)/SavedContacts"
        return destinationPath
    }
    
    func createContact() -> Contact {
        let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: coreDataManager.context) as? Contact
        
        let address = NSEntityDescription.insertNewObjectForEntityForName("Address", inManagedObjectContext: coreDataManager.context) as? Address
        
        contact?.address = address
        
        let uuid = NSUUID()
        
        contact?.contactId = uuid.UUIDString
        
        return contact!
    }
    
    func save() {
        
        do {
            try self.coreDataManager.context.save()
        } catch {
            
            print("Failed to save context: \(error)")
            
        }
    }
    
    func getContact(contactId contactId: String) -> Contact? {
        //Code goes here
        let query = NSFetchRequest(entityName: "Contact")
        let filter = NSPredicate(format: "contactId = %@", String(contactId))
        
        query.predicate = filter
        
        do {
            if let results = try self.coreDataManager.context.executeFetchRequest(query) as? [Contact] where results.count > 0 {
                return results[0]
            }
        }
        catch {
            print("Failed to query for contact: \(error)")
        }
        return nil
    }
}