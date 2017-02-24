//: Playground - noun: a place where people can play

import UIKit

//save

let array = ["hello","world","!"]

func saveData () {
    let defaults = UserDefaults.standard
    defaults.set(array, forKey: "newArray")
}
//load

func loadDate () {

    let defaults = UserDefaults.standard
    let loadedArray = defaults.array(forKey: "newArray")
    
    print(loadedArray!)
    
}