//
//  AddCatetoryViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/28/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import CoreData

protocol AddNewCategoryDelegate {
    
    func addNewCategoryDidSave(categoryName :String)
    
}

class AddCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTextField :UITextField!
    var managedObjectContext :NSManagedObjectContext!
    var groceryCategories :[GroceryCategory]!
    var delegate: AddNewCategoryDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed() {
        var groceryCategory :String = ""
        groceryCategory = self.categoryTextField.text!
        self.delegate.addNewCategoryDidSave(categoryName: groceryCategory)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
