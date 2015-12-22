//
//  Contact+CoreDataProperties.swift
//  Contacts
//
//  Created by Griffin Hammer on 12/21/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var address: Address?

}
