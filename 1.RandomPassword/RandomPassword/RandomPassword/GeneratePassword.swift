//
//  GeneratePassword.swift
//  RandomPassword
//
//  Created by GWesley on 7/18/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Foundation

private let characters = Array("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)

func generateRandomStringWithLength(length: Int) -> String {
    var string = ""
    
    for _ in 0..<length {
        string.append(generateRandomCharacter())
    }
    return string
}

func generateRandomCharacter() -> Character {
    let index = Int(arc4random_uniform( UInt32(characters.count) ))
    return characters[index]
}