//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Griffin Hammer on 11/11/15.
//  Copyright © 2015 Griffin Hammer. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    var delegate : NewContactDelegate?
    var editContactId : String?
    private var editedContact: Contact?
    
    func updateTextFields() {
        self.firstNameTextField.text = self.editedContact?.firstName
        self.lastNameTextField.text = self.editedContact?.lastName
        self.phoneNumberTextField.text = self.editedContact?.phoneNumber
        self.streetAddressTextField.text = self.editedContact?.address?.street
        self.cityTextField.text = self.editedContact?.address?.city
        self.stateTextField.text = self.editedContact?.address?.state
        self.zipCodeTextField.text = self.editedContact?.address?.zipCode
        
    }
    
    func updateContact(contact: Contact) {
        contact.firstName = self.firstNameTextField.text
        contact.lastName = self.lastNameTextField.text
        contact.phoneNumber = self.phoneNumberTextField.text
        contact.address?.street = self.streetAddressTextField.text
        contact.address?.city = self.cityTextField.text
        contact.address?.state = self.stateTextField.text
        contact.address?.zipCode = self.zipCodeTextField.text
        
        DataManager.sharedManager.save()
        
        if self.delegate != nil{
            if self.editedContact != nil {
                self.delegate?.didUpdateContact(contact)
            }
            else{
                self.delegate!.didUpdateContact(contact)
            }
        }

    }
    
    @IBAction func saveButtonTouched(sender: AnyObject) {
        
        var contact : Contact! = nil
        
        if self.editedContact != nil {
            contact = self.editedContact
        }
        else{
            contact = DataManager.sharedManager.createContact()
        }
        
        self.updateContact(contact)
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contactId = self.editContactId {
            self.editedContact = DataManager.sharedManager.getContact(contactId: contactId)
            if self.editedContact != nil {
                self.updateTextFields()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
