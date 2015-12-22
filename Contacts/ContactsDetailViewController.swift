//
//  ContactsDetailViewController.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/9/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    
    var selectedContact : Contact!
    
    override func viewDidLoad() {
        self.firstName.text = selectedContact.firstName
        self.lastName.text = selectedContact.lastName
        self.phoneNumber.text = selectedContact.phoneNumber
        self.streetAddress.text = self.selectedContact.address?.street
        self.city.text = self.selectedContact.address?.city
        self.state.text = self.selectedContact.address?.state
        self.zipCode.text = self.selectedContact.address?.zipCode
    }
    
    
    
}
