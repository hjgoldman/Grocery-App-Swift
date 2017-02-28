//
//  GroceryCategoriesTableViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/23/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import CoreData


class GroceryCategoriesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, AddNewCategoryDelegate {
    
    var managedObjectContext :NSManagedObjectContext!
    var groceryCategories :[GroceryCategory]!
    
    var fetchResultsController :NSFetchedResultsController<GroceryCategory>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Grocery List"
        
        let request = NSFetchRequest<GroceryCategory>(entityName: "GroceryCategory")
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.fetchResultsController.delegate = self
        
        try! self.fetchResultsController.performFetch()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    //add category
    func addNewCategoryDidSave(categoryName :String){
        
        let groceryCategory = GroceryCategory(context: self.managedObjectContext)
        groceryCategory.title = categoryName
        
        try! self.managedObjectContext.save()
    }
    

    //delete category
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // delete the record
            
            let groceryCategory = self.fetchResultsController.object(at: indexPath)
            self.managedObjectContext.delete(groceryCategory)
            try! self.managedObjectContext.save()
        }
    }
    
    
    //edit table
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if type == .insert {
            self.tableView.insertRows(at: [newIndexPath!], with: .automatic)
        } else if type == .delete {
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        }
    }

    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "AddCategory" {
            let addCategoryVC: AddCategoryViewController = segue.destination as! AddCategoryViewController
            addCategoryVC.delegate = self
        } else if segue.identifier == "ShowCategory" {

        }
    }
   
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = self.fetchResultsController.sections else {
            return 0
        }
        return sections[section].numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let groceryCategory = self.fetchResultsController.object(at: indexPath)
        cell.textLabel?.text = groceryCategory.title
        return cell
    }
    
}
