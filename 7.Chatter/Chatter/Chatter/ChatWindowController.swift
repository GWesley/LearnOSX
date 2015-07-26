//
//  ChatWindowController.swift
//  Chatter
//
//  Created by GWesley on 15/7/26.
//  Copyright © 2015年 GWesley. All rights reserved.
//

import Cocoa

private let ChatWindowControllerDidSendMessageNotification = "com.gwesley.chatter.ChatWindowControllerDidSendMessageNotification"
private let ChatWindowControllerMessageKey =
    "com.gwesley.chatter.ChatWindowControllerMessageKey"

class ChatWindowController: NSWindowController {
    
    dynamic var log: NSAttributedString =  NSAttributedString(string: "")
    dynamic var message: String?
    @IBOutlet var textView: NSTextView!
    
    // MARK: - LifeCycle
    override func windowDidLoad() {
        super.windowDidLoad()

        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: Selector("receiveDidSendMessageNotification:"), name: ChatWindowControllerDidSendMessageNotification, object: nil)
    }
    
    override var windowNibName: String {
        return "ChatWindowController"
    }
    
    deinit {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.removeObserver(self)
    }
    
    // MARK: - Actions
    @IBAction func send(sender: NSButton) {
        sender.window?.endEditingFor(nil)
        if let message = message {
            let userInfo = [ChatWindowControllerMessageKey : message]
            let notificationCenter =  NSNotificationCenter.defaultCenter()
            notificationCenter.postNotificationName(ChatWindowControllerDidSendMessageNotification, object: self, userInfo: userInfo)
        }
        message = ""
        
    }
    
    // MARK: - Notifications
    func receiveDidSendMessageNotification(note: NSNotification) {
        let mutableLog = log.mutableCopy() as! NSMutableAttributedString
        
        if log.length > 0 {
            mutableLog.appendAttributedString(NSAttributedString(string: "\n"))
        }
        
        let userInfo = note.userInfo as! [String: String]
        let message = userInfo[ChatWindowControllerMessageKey]!
        
        mutableLog.appendAttributedString(NSAttributedString(string: message))
        
        log = mutableLog.copy() as! NSAttributedString
        textView.scrollRangeToVisible(NSRange(location: log.length, length: 0))
    }
    
    
}
