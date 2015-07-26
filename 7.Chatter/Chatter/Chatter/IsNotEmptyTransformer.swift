
//
//  IsNotEmptyTransformer.swift
//  Chatter
//
//  Created by GWesley on 15/7/26.
//  Copyright © 2015年 GWesley. All rights reserved.
//

import Cocoa

@objc(IsNotEmptyTransformer) class IsNotEmptyTransformer: NSValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        return NSNumber.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
    override func transformedValue(value: AnyObject?) -> AnyObject? {
        
        if let value = value as? String{
            return value.characters.count > 0
        }
        
        return false

    }
}
