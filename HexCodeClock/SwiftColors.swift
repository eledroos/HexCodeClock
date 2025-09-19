//  SwiftColors.swift
//
// Copyright (c) 2014 Doan Truong Thi
// Updated for macOS 26 compatibility
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if os(iOS)
    import UIKit
    typealias SWColor = UIColor
#else
    import Cocoa
    typealias SWColor = NSColor
#endif

public extension SWColor {
    /**
    Create non-autoreleased color with in the given hex string
    Alpha will be set as 1 by default
    
    - Parameter hexString: The hex color string (e.g., "#FF0000" or "FF0000")
    - Returns: color with the given hex string
    */
    convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    /**
    Create non-autoreleased color with in the given hex string and alpha
    
    - Parameter hexString: The hex color string (e.g., "#FF0000" or "FF0000")
    - Parameter alpha: The alpha value (0.0 to 1.0)
    - Returns: color with the given hex string and alpha
    */
    convenience init?(hexString: String, alpha: Float) {
        var hex = hexString
        
        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = String(hex.dropFirst())
        }
        
        // Validate hex string
        guard hex.range(of: "^[0-9A-Fa-f]{6}$|^[0-9A-Fa-f]{3}$", options: .regularExpression) != nil else {
            return nil
        }
        
        // Handle 3-character hex strings
        if hex.count == 3 {
            let chars = Array(hex)
            hex = String([chars[0], chars[0], chars[1], chars[1], chars[2], chars[2]])
        }
        
        // Parse hex values using modern Swift
        guard let red = Int(String(hex.prefix(2)), radix: 16),
              let green = Int(String(hex.dropFirst(2).prefix(2)), radix: 16),
              let blue = Int(String(hex.suffix(2)), radix: 16) else {
            return nil
        }
        
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    /**
    Create non-autoreleased color with in the given hex value
    Alpha will be set as 1 by default
    
    - Parameter hex: The hex color value (e.g., 0xFF0000)
    - Returns: color with the given hex value
    */
    convenience init?(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }
    
    /**
    Create non-autoreleased color with in the given hex value and alpha
    
    - Parameter hex: The hex color value (e.g., 0xFF0000)
    - Parameter alpha: The alpha value (0.0 to 1.0)
    - Returns: color with the given hex value and alpha
    */
    convenience init?(hex: Int, alpha: Float) {
        let hexString = String(format: "%02X", hex)
        self.init(hexString: hexString, alpha: alpha)
    }
}