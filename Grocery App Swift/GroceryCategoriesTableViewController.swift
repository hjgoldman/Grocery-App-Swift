//
//  GroceryCategoriesTableViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/23/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class GroceryCategoriesTableViewController: UITableViewController, AddNewCategoryDelegate {
    
    var groceryCategories :Array<Any> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Grocery List"
        
//        let category1 = Category()
//        category1.title = "HEB"
//        
//        let item1 = Item()
//        item1.title = "Beer"
//        
//        let item2 = Item()
//        item2.title = "Chips"
//        
//        category1.groceryItems.append(item1)
//        category1.groceryItems.append(item2)
//
//        
//        let category2 = Category()
//        category2.title = "WholeFoods"
//        let category3 = Category()
//        category3.title = "CVS"
//        
//        groceryCategories.append(category1)
//        groceryCategories.append(category2)
//        groceryCategories.append(category3)
        
        

       self.loadData()
        
    }
    
    func saveData() {
        let data = NSKeyedArchiver.archivedData(withRootObject: self.groceryCategories) 
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "data")
        defaults.synchronize()
        
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        let data = defaults.value(forKey: "data") as! Data
        let groceries = NSKeyedUnarchiver.unarchiveObject(with: data) as! Array<Any>
        self.groceryCategories = groceries
    }
    
    func addNewCategoryDidSave(categoryName: Category) {
        groceryCategories.append(categoryName)
        self.saveData()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
        if segue.identifier == "AddCategory" {
            
            let addCategoryVC: AddCategoryViewController = segue.destination as! AddCategoryViewController
            addCategoryVC.delegate = self
        
        
        } else if segue.identifier == "ShowCategory" {
            
            
            let indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
            
            let groceryCategory = self.groceryCategories[indexPath.row] as! Category
            
            let categoryDetailVC: CategoryItemTableViewController = segue.destination as! CategoryItemTableViewController
            
            categoryDetailVC.category = groceryCategory

        }
    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryCategories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)

        // Configure the cell...
        
        let categoryName = groceryCategories[indexPath.row] as! Category
        
        cell.textLabel?.text = categoryName.title
        
        return cell
    }
    
}
