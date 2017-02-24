//
//  Category.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/23/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var title :String?
    var groceryItems = [Any]()
    
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
        coder.encode(self.groceryItems, forKey: "groceryItems")
    }

    required init(coder decoder: NSCoder) {
        self.title = decoder.decodeObject(forKey: "title") as! String?
        self.groceryItems = decoder.decodeObject(forKey: "groceryItems") as! [Any]
    }
}
