//
//  AddCategoryViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/23/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

protocol AddNewCategoryDelegate {
    
    func addNewCategoryDidSave(categoryName :Category)

}

class AddCategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTextField :UITextField!
    var delegate: AddNewCategoryDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed() {
        
        let category = Category(coder:NSCoder())
        category.title = self.categoryTextField.text
        
        self.delegate.addNewCategoryDidSave(categoryName: category)
        
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancelButtonPressed() {
        
        self.dismiss(animated: true, completion: nil)

    }



}
