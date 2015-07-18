//
//  MainWindowController.swift
//  RandomPassword
//
//  Created by GWesley on 7/18/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    @IBOutlet weak var passwordField: NSTextField!
    
    override var windowNibName: String {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func generatePassword(sender: AnyObject) {
        passwordField.stringValue = generateRandomStringWithLength(10)
    }
}

