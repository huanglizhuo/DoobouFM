//
//  GradientView.swift
//  DouBanFM
//
//  Created by lizhuo on 3/25/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Foundation
import Cocoa
class GradientView: NSView {
    override func draw(_ dirtyRect: NSRect) {
        let path = NSBezierPath()
        path.appendRect(dirtyRect)
//        let gradient = NSGradient(colors: [NSColor(deviceRed:0.09, green:0.917, blue:0.850, alpha:1.00), NSColor(deviceRed:0.376, green:0.4705, blue:0.9176, alpha:1.00)], atLocations: [0, 1], colorSpace: NSColorSpace.deviceRGB)
        let gradient = NSGradient(colors: [NSColor(hexString: "#FC466B")! ,NSColor(hexString:"#3F5EFB")!], atLocations: [0, 1], colorSpace: NSColorSpace.deviceRGB)

        gradient?.draw(in: path, angle: -45)
    }
}

private extension Int {
    func duplicate4bits() -> Int {
        return (self << 4) + self
    }
}
public extension NSColor {
    public convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    private convenience init?(hex3: Int, alpha: Float) {
        self.init(red:   CGFloat( ((hex3 & 0xF00) >> 8).duplicate4bits() ) / 255.0,
                  green: CGFloat( ((hex3 & 0x0F0) >> 4).duplicate4bits() ) / 255.0,
                  blue:  CGFloat( ((hex3 & 0x00F) >> 0).duplicate4bits() ) / 255.0,
                  alpha: CGFloat(alpha))
    }
    
    private convenience init?(hex6: Int, alpha: Float) {
        self.init(red:   CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
                  blue:  CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0, alpha: CGFloat(alpha))
    }
    
    public convenience init?(hexString: String, alpha: Float) {
        var hex = hexString
        
        if hex.hasPrefix("#") {
            hex = String(hex[hex.index(after: hex.startIndex)...])
        }
        
        guard let hexVal = Int(hex, radix: 16) else {
            self.init()
            return nil
        }
        
        switch hex.count {
        case 3:
            self.init(hex3: hexVal, alpha: alpha)
        case 6:
            self.init(hex6: hexVal, alpha: alpha)
        default:
            self.init()
            return nil
        }
    }
    
    public convenience init?(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }
    
    public convenience init?(hex: Int, alpha: Float) {
        if (0x000000 ... 0xFFFFFF) ~= hex {
            self.init(hex6: hex, alpha: alpha)
        } else {
            self.init()
            return nil
        }
    }
}
