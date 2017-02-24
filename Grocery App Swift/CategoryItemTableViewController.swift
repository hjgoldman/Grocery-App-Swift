//
//  CategoryItemTableViewController.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/23/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class CategoryItemTableViewController: UITableViewController, AddNewItemDelegate {
    
    var selectedCategoryIndex :Int = 0
    var category = Category(coder:NSCoder())
    
    override func viewDidLoad() {
        super.viewDidLoad()

    title = category.title
    
    
    }
    
    func addNewItemnDidSave(categoryName :Item) {
        
        category.groceryItems.append(categoryName)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let addItemVC: AddItemViewController = segue.destination as! AddItemViewController
        addItemVC.delegate = self
        
    }
    

 

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return category.groceryItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        // Configure the cell...
        
        let itemName = category.groceryItems[indexPath.row] as! Item
        
        cell.textLabel?.text = itemName.title

        return cell
    }
    
}
