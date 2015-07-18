//
//  MainWindowController.swift
//  RGBWell
//
//  Created by GWesley on 7/19/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    var r = 0.0
    var g = 0.0
    var b = 0.0
    let a = 1.0
    
    
    @IBOutlet weak var colorWell: NSColorWell!
    @IBOutlet weak var rSlider: NSSlider!
    @IBOutlet weak var gSlider: NSSlider!
    @IBOutlet weak var bSlider: NSTextField!
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        rSlider.doubleValue = r
        gSlider.doubleValue = g
        bSlider.doubleValue = b
        updateColorWell()
    }
    
    @IBAction func adjustRed(sender: NSSlider) {
        r = sender.doubleValue
        updateColorWell()
    }
    
    @IBAction func adjustGreen(sender: NSSlider) {
        g = sender.doubleValue
        updateColorWell()
    }
    
    @IBAction func adjustBlue(sender: NSSlider) {
        b = sender.doubleValue
        updateColorWell()
    }
    
    func updateColorWell() {
        let newColor = NSColor(calibratedRed: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
        colorWell.color = newColor
    }
    
}
