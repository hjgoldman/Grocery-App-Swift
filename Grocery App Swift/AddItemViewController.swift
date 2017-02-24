//
//  AddItemViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/23/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

protocol AddNewItemDelegate {
    
    func addNewItemnDidSave(categoryName :Item)
    
}

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var itemTextField :UITextField!
    var delegate: AddNewItemDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func saveButtonPressed() {
        
        let item = Item(coder:NSCoder())
        item.title = self.itemTextField.text!
        
        self.delegate.addNewItemnDidSave(categoryName: item)
        
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancelButtonPressed() {
        
        
        self.dismiss(animated: true, completion: nil)

    }

}
