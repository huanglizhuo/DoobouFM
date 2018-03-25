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
        
        let gradient = NSGradient(colors: [NSColor(deviceRed:0.08, green:0.66, blue:0.84, alpha:1.00), NSColor(deviceRed:0.05, green:0.47, blue:0.73, alpha:1.00)], atLocations: [0, 1], colorSpace: NSColorSpace.deviceRGB)
        gradient?.draw(in: path, angle: -90)
    }
}
