//
//  HexCodeClockView.swift
//  HexCodeClock
//
//  Created by Nasser Eledroos on 10/15/15.
//  Copyright © 2015 Nasser Eledroos. All rights reserved.
//  Updated for macOS 26 compatibility
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
    
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()
    private let colorFormatter = DateFormatter()
    
    override init(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)!
        self.animationTimeInterval = 1
        
        // Configure formatters
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        timeFormatter.dateFormat = "HHmmss"
        colorFormatter.dateFormat = "HHmmss"
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
        
        let now = Date()
        let dateString = dateFormatter.string(from: now)
        let timeString = timeFormatter.string(from: now)
        let colorString = colorFormatter.string(from: now)
        
        // Set background color from time
        if let color = NSColor(hexString: "#\(colorString)") {
            color.set()
            rect.fill()
        }
        
        // Determine text color based on appearance
        let textColor = effectiveAppearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua ? 
            NSColor.white : NSColor.black
        
        // Draw time
        let timeDisplay = "#\(timeString)"
        let timeAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont(name: "SF Pro Display", size: 70) ?? NSFont.systemFont(ofSize: 70, weight: .ultraLight),
            .foregroundColor: textColor
        ]
        
        let timeSize = timeDisplay.size(withAttributes: timeAttributes)
        let timePoint = NSPoint(
            x: (frame.width - timeSize.width) / 2,
            y: (frame.height - timeSize.height) / 2 + 20
        )
        timeDisplay.draw(at: timePoint, withAttributes: timeAttributes)
        
        // Draw date
        let dateAttributes: [NSAttributedString.Key: Any] = [
            .font: NSFont(name: "SF Pro Display", size: 25) ?? NSFont.systemFont(ofSize: 25, weight: .ultraLight),
            .foregroundColor: textColor
        ]
        
        let dateSize = dateString.size(withAttributes: dateAttributes)
        let datePoint = NSPoint(
            x: (frame.width - dateSize.width) / 2,
            y: (frame.height - dateSize.height) / 2 - 40
        )
        dateString.draw(at: datePoint, withAttributes: dateAttributes)
    }
    
    override func animateOneFrame() {
        needsDisplay = true
    }
    
    func hasConfigureSheet() -> Bool {
        return false
    }
    
    func configureSheet() -> NSWindow? {
        return nil
    }
}
