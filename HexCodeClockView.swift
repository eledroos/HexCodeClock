//
//  HexCodeClockView.swift
//  HexCodeClock
//
//  Created by Nasser Eledroos on 10/15/15.
//  Copyright © 2015 Nasser Eledroos. All rights reserved.
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Cocoa
import ScreenSaver

class HexCodeClockView: ScreenSaverView {
    
    let date: Date = Date()
    let formatter: DateFormatter = DateFormatter()
    var datePrefix: String = ""
    var timePrefix: String = ""
    var time: String = ""
    var timeForColor: String = ""
    var color: NSColor = NSColor()
    
    override init(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)!
        self.animationTimeInterval = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
        formatter.dateFormat = "EEEE, dd MMMM YYYY"
        datePrefix = formatter.string(from: Date())
        formatter.dateFormat = "HHmmss"
        timePrefix = formatter.string(from: Date())
        formatter.dateFormat = "HHmmss"
        timeForColor = formatter.string(from: Date())
        
        color = NSColor(hexString: "#\(timeForColor)")! //sets color value to hex from current time
        color.set()
        NSRectFill(rect)
        
        time = "#\(timePrefix)" // Adds '#' for display
        datePrefix.capitalized // Capitalizes each first letter
        
        let catTime: NSString = time as NSString // concatenate time as NSString to determineCGSize
        let catDate: NSString = datePrefix as NSString // concatenate date as NSString to determine CGSize
        let timeSize: CGSize = catTime.size(withAttributes: [NSFontAttributeName: NSFont(name: "HelveticaNeue-UltraLight", size: 70.0)!])
        let dateSize: CGSize = catDate.size(withAttributes: [NSFontAttributeName: NSFont(name: "HelveticaNeue-UltraLight", size: 25.0)!])
        
        // What the below does, is take half of the dimens. of the time String, and subtract that from half of the frame dimens.
        time.draw(at: NSMakePoint((self.frame.size.width/2 - timeSize.width/2), (self.frame.size.height/2 - timeSize.height/8)), withAttributes: [NSFontAttributeName: NSFont(name: "HelveticaNeue-UltraLight", size: 70.0)!, NSForegroundColorAttributeName: NSColor.white])
        datePrefix.draw(at: NSMakePoint((self.frame.size.width/2 - dateSize.width/2), (self.frame.size.height/2 - dateSize.height)), withAttributes: [NSFontAttributeName: NSFont(name: "HelveticaNeue-UltraLight", size: 25.0)!, NSForegroundColorAttributeName: NSColor.white])
    }
    
    override func animateOneFrame() {
        needsDisplay = true // The subclass lets drawRect: perform the drawing 
                            // in which case animateOneFrame needs to call 
                            // [Obj-C] setNeedsDisplay: with an argument of true
    }
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
    override func configureSheet() -> NSWindow? {
        return nil
    }
    

}
