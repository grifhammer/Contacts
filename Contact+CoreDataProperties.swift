//
//  Contact+CoreDataProperties.swift
//  Contacts
//
//  Created by Griffin Hammer on 1/6/16.
//  Copyright © 2016 Griffin Hammer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var contactId: NSNumber?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var address: Address?

}
