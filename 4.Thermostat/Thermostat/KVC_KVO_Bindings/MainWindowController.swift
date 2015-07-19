//
//  MainWindowController.swift
//  Thermostat
//
//  Created by GWesley on 7/19/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    dynamic var temperature = 68
    dynamic var isOn = true
    
    override var windowNibName: String {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    // MARK: - Actions
    @IBAction func makeWarmer(sender: NSButton) {
        temperature++
    }
    
    @IBAction func makeCooler(sender: NSButton) {
        temperature--
    }
}
