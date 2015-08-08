//
//  DieView.swift
//  Dice
//
//  Created by GWesley on 15/7/26.
//  Copyright © 2015年 GWesley. All rights reserved.
//

import Cocoa

class DieView: NSView {
    
    //Change the default value here to observe its change
    var intValue: Int? = 3 {
        didSet {
            needsDisplay = true
        }
    }
    
    var pressed: Bool = false {
        didSet {
            needsDisplay = true;
        }
    }
    
    override var intrinsicContentSize: NSSize {
        return NSSize(width: 50, height: 50)
    }
    
    override func drawRect(dirtyRect: NSRect) {
        let bacgroundColor = NSColor.lightGrayColor()
        bacgroundColor.set()
        NSBezierPath.fillRect(bounds)
        
        drawDieWithSize(bounds.size)
    }
    
    func metricsForSize(size: CGSize) -> (edgeLength: CGFloat, dieFrame: CGRect) {
        let edgeLength = min(size.width, size.height)
        let padding = edgeLength/10.0
        let drawingBounds = CGRect(x: 0, y: 0, width: edgeLength, height: edgeLength)
        var dieFrame = drawingBounds.rectByInsetting(dx: padding, dy: padding)
        if pressed {
            dieFrame = dieFrame.rectByOffsetting(dx: 0, dy: -edgeLength/40)
        }
        return (edgeLength, dieFrame)
    }
    
    func drawDieWithSize(size: CGSize) {
        
        if let intValue = intValue {
            let (edgeLength, dieFrame) = metricsForSize(size)
            let cornerRadius: CGFloat = edgeLength/5.0
            let dotRadius = edgeLength/12.0
            let dotFrame = dieFrame.rectByInsetting(dx: dotRadius * 2.5, dy: dotRadius * 2.5)
            
            NSGraphicsContext.saveGraphicsState()
            let shadow = NSShadow()
            shadow.shadowOffset = NSSize(width: 0, height: -1)
            shadow.shadowBlurRadius = (pressed ? edgeLength/100 : edgeLength/20)
            shadow.set()
            
            //Draw the rounded shape of the die profile
            NSColor.whiteColor().set()
            NSBezierPath(roundedRect: dieFrame, xRadius: cornerRadius, yRadius: cornerRadius).fill()
            NSGraphicsContext.restoreGraphicsState()
            
            //dot
            NSColor.blackColor().set()
            func drawDot(u u: CGFloat, v: CGFloat) {
                let dotOrigin = CGPoint(x: dotFrame.minX + dotFrame.width * u,
                                        y: dotFrame.minY + dotFrame.height * v)
                let dotRect =  CGRect(origin: dotOrigin, size: CGSizeZero).rectByInsetting(dx: -dotRadius, dy: -dotRadius)
                NSBezierPath(ovalInRect: dotRect).fill()
                
            }
            
            //if intValue is in range...
            if (1...6).indexOf(intValue) != nil {
                //draw the dots:
                if [1, 3, 5].indexOf(intValue) != nil {
                    drawDot(u: 0.5, v: 0.5) // center dot
                }
                
                if (2...6).indexOf(intValue) != nil {
                    drawDot(u: 0, v: 1)
                    drawDot(u: 1, v: 0)
                }
                
                if (4...6).indexOf(intValue) != nil {
                    drawDot(u: 1, v: 1)
                    drawDot(u: 0, v: 0)
                }
                
                if intValue == 6 {
                    drawDot(u: 0, v: 0.5)
                    drawDot(u: 1, v: 0.5)
                }
            }
        }
        
    }
    
    func randomize() {
        intValue = Int(arc4random_uniform(5)) + 1
    }
    
    // MARK: - Mouse Events
    override func mouseDown(theEvent: NSEvent) {
        Swift.print("mouseDown")
        let dieFrame = metricsForSize(bounds.size).dieFrame
        let pointInView = convertPoint(theEvent.locationInWindow, fromView: nil)
        pressed = dieFrame.contains(pointInView)
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        Swift.print("mouseDragged location: \(theEvent.locationInWindow)")
    }
    
    override func mouseUp(theEvent: NSEvent) {
        Swift.print("mouseUp clickCount: \(theEvent.clickCount)")
        if theEvent.clickCount == 2 {
            randomize()
        }
        pressed = false
    }
}
