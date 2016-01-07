//
//  ContactsDetailViewController.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/9/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController, NewContactDelegate {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    var selectedContact : Contact!
    
    override func viewDidLoad() {
        self.firstNameLabel.text = selectedContact.firstName
        self.lastNameLabel.text = selectedContact.lastName
        self.phoneNumberLabel.text = selectedContact.phoneNumber
        self.streetAddressLabel.text = self.selectedContact.address?.street
        self.cityLabel.text = self.selectedContact.address?.city
        self.stateLabel.text = self.selectedContact.address?.state
        self.zipCodeLabel.text = self.selectedContact.address?.zipCode
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditContactSegue" {
            
            if let vc = segue.destinationViewController as? NewContactViewController {
                vc.delegate = self
                vc.editContactId = selectedContact.contactId
            }
        }
    }
    
    func updateLabels() {
        self.firstNameLabel.text = self.selectedContact?.firstName
        self.lastNameLabel.text = self.selectedContact?.lastName
        self.phoneNumberLabel.text = self.selectedContact?.phoneNumber
        self.streetAddressLabel.text = self.selectedContact?.address?.street
        self.cityLabel.text = self.selectedContact?.address?.city
        self.stateLabel.text = self.selectedContact?.address?.state
        self.zipCodeLabel.text = self.selectedContact?.address?.zipCode

    }
    
    
    func didUpdateContact(contact: Contact) {
        self.selectedContact = contact
        self.updateLabels()
    }
    
    func didCreateNewContact(newContact: Contact) {
        //Intentionally left blank
    }
    
}
