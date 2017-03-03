//
//  AddItemViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 3/2/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

protocol AddNewItemDelegate {
    func addItemDidSave(itemName :String)
}

class AddItemViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemTextField :UITextField!
    var delegate: AddNewItemDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemTextField.delegate = self
    }
    
    @IBAction func saveButtonPressed() {
        var groceryItem :String?
        groceryItem = self.itemTextField.text!
        self.delegate.addItemDidSave(itemName: groceryItem!)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
