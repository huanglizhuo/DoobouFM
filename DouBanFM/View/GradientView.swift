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
        let gradient = NSGradient(colors: [NSColor(deviceRed:0.09, green:0.917, blue:0.850, alpha:1.00), NSColor(deviceRed:0.376, green:0.4705, blue:0.9176, alpha:1.00)], atLocations: [0, 1], colorSpace: NSColorSpace.deviceRGB)
        gradient?.draw(in: path, angle: -45)
    }
}

extension NSColor{
    func RGB2NSColor(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat? = 1) ->NSColor{
        return NSColor(red: r/255, green: g/255, blue: b/255, alpha: alpha!)
    }
}

