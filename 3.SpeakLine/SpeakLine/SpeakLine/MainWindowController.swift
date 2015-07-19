//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by GWesley on 7/19/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController,NSSpeechSynthesizerDelegate {
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakBtn: NSButton!
    @IBOutlet weak var stopBtn: NSButton!
    
    let speechSynth = NSSpeechSynthesizer()
    var isStarted: Bool = false {
        didSet {
            updateBtns()
        }
    }
    
    override var windowNibName: String {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        updateBtns()
        speechSynth.delegate = self
    }
    
    // MARK: - NSSpeechSynthesizerDelegate
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isStarted = false
    }
    
    // MARK: - Actions
    
    @IBAction func speakIt(sender: NSButton) {
        let string = textField.stringValue
        
        if !string.isEmpty {
            speechSynth.startSpeakingString(string)
            isStarted = true
        }
    }
    
    @IBAction func stopIt(sender: NSButton) {
        speechSynth.stopSpeaking()
    }
    
    func updateBtns() {
        speakBtn.enabled = !isStarted
        stopBtn.enabled = isStarted
    }
}
