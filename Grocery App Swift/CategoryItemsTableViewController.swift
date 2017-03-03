//
//  CategoryItemsTableViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/28/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import CoreData

class CategoryItemsTableViewController: UITableViewController, AddNewItemDelegate {
    
    var managedObjectContext :NSManagedObjectContext!
    var groceryCategory :GroceryCategory!
    var groceryItem :GroceryItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = groceryCategory.title
        
    }

    //add item
    func addItemDidSave(itemName :String) {
        
        let groceryItem = GroceryItem(context: self.managedObjectContext)
        groceryItem.title = itemName
        groceryItem.groceryCategory = groceryCategory
        
        try! self.managedObjectContext.save()
        
        self.tableView.reloadData()
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "AddItem" {
            let addItemVC: AddItemViewController = segue.destination as! AddItemViewController
            addItemVC.delegate = self
        }
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (groceryCategory.groceryItems?.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let groceryItem = groceryCategory.groceryItems?.allObjects as! [GroceryItem]
        let specificItem = groceryItem[indexPath.row]
        
        cell.textLabel?.text = specificItem.title
        
        return cell
    }
    
    //edit table
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if type == .insert {
            self.tableView.insertRows(at: [newIndexPath!], with: .automatic)
        } else if type == .delete {
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        }
    }
    
    //delete item
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // delete the record
            
            let groceryItem = groceryCategory.groceryItems?.allObjects as! [GroceryItem]
            let specificItem = groceryItem[indexPath.row]

            self.managedObjectContext.delete(specificItem)
            try! self.managedObjectContext.save()
            
            self.tableView.reloadData()

        }
    }
    



}
