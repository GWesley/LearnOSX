//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by GWesley on 7/19/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, NSSpeechSynthesizerDelegate, NSTableViewDataSource, NSTableViewDelegate {
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakBtn: NSButton!
    @IBOutlet weak var stopBtn: NSButton!
    @IBOutlet weak var tableView: NSTableView!
    
    let speechSynth = NSSpeechSynthesizer()
    let voices = NSSpeechSynthesizer.availableVoices()
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
        
        let defaultVoice = NSSpeechSynthesizer.defaultVoice()
        if let defaultRow = voices.indexOf(defaultVoice) {
            let indices = NSIndexSet(index: defaultRow)
            tableView.selectRowIndexes(indices, byExtendingSelection: false)
            tableView.scrollRowToVisible(defaultRow)
        }
    }
    
    func voiceNameForIdentifier(identifier: String) -> String {
        let attributes = NSSpeechSynthesizer.attributesForVoice(identifier)
        return String(attributes[NSVoiceName]!)
    }
    
    
    // MARK: - NSSpeechSynthesizerDelegate
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isStarted = false
    }
    
    // MARK: - TableViewDataSource
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return voices.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        let voice = voices[row]
        let voiceName = voiceNameForIdentifier(voice)
        return voiceName
    }
    
    // MARK: - TableViewDelegate
    func tableViewSelectionDidChange(notification: NSNotification) {
        let row = tableView.selectedRow
        
        if row == -1 {
            speechSynth.setVoice(nil)
            return
        }
        
        let voice = voices[row]
        speechSynth.setVoice(voice)
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
