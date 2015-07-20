//
//  Employee.swift
//  RaiseMan
//
//  Created by GWesley on 7/19/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Foundation

class Employee: NSObject, NSCoding {
    var name: String? = "NewEmployee"
    var raise: Float = 0.00
    
    override func validateValue(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, forKey inKey: String) throws {
        
        if inKey == "raise" {
            if ioValue.memory != nil {
                let domian = "UserInputValidationErrorDomain"
                let code = 0
                let userInfo = [NSLocalizedDescriptionKey: "An emoloyee's raise must be a number"]
                throw NSError(domain: domian, code: code, userInfo: userInfo)
            }
        }

    }
    
    override init() {
        super.init()
    }
    
    // MARK: - NSCoding
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String?
        raise = aDecoder.decodeFloatForKey("raise")
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let name = name {
            aCoder.encodeObject(name, forKey: "name")
        }
        aCoder.encodeFloat(raise, forKey: "raise")
    }
}