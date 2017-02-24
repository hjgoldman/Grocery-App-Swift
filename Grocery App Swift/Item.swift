//
//  Item.swift
//  Grocery App Swift
//
//  Created by Hayden Goldman on 2/23/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var title :String?
    
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
    }
    
    required init(coder decoder: NSCoder) {
        self.title = decoder.decodeObject(forKey: "title") as! String?
    }
}
