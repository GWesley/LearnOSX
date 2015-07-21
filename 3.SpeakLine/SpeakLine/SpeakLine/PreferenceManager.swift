//
//  PreferenceManager.swift
//  SpeakLine
//
//  Created by GWesley on 7/21/15.
//  Copyright © 2015 GWesley. All rights reserved.
//

import Cocoa

class PreferenceManager {
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    private let activeVoiceKey = "activeVoice"
    private let activeTextKey = "activeText"
    
    init() {
        registerDefaultPreferences()
    }
    
    func registerDefaultPreferences() {
        let defaults = [activeVoiceKey: NSSpeechSynthesizer.defaultVoice(),
            activeTextKey: "What the fuck are you doing ?"
        ]
        userDefaults.registerDefaults(defaults)
        
    }
    
    var activeVoice: String? {
        
        set(newActiveVoice) {
            userDefaults.setObject(newActiveVoice, forKey: activeVoiceKey)
        }
        
        get {
            return userDefaults.objectForKey(activeVoiceKey) as? String
        }
    }
    
    var activeText: String? {
        
        set(newActiveText) {
            userDefaults.setObject(newActiveText, forKey: activeTextKey)
        }
        
        get {
            return userDefaults.objectForKey(activeTextKey) as? String
        }
    }
}