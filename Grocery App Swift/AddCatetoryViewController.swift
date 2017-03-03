//
//  AddCatetoryViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/28/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

protocol AddNewCategoryDelegate {
    func addNewCategoryDidSave(categoryName :String)
}

class AddCategoryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var categoryTextField :UITextField!
    var delegate: AddNewCategoryDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        categoryTextField.delegate = self
    }
    
    @IBAction func saveButtonPressed() {
        var groceryCategory :String?
        groceryCategory = self.categoryTextField.text!
        self.delegate.addNewCategoryDidSave(categoryName: groceryCategory!)
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
