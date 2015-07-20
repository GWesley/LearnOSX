//
//  CarArrayController.swift
//  CarLot
//
//  Created by GWesley on 7/21/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Cocoa

class CarArrayController: NSArrayController {
    
    override func newObject() -> AnyObject {
        let newObj = super.newObject() as! NSObject
        let now = NSDate()
        newObj.setValue(now, forKey: "datePurchased")
        return newObj
    }
}
