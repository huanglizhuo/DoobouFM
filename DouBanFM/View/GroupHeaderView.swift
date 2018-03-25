//
//  GroupHeader.swift
//  DouBanFM
//
//  Created by lizhuo on 3/25/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Foundation
import Cocoa

class GroupHeaderView: NSView {
    
    @IBOutlet weak var groupName: NSTextField!
    @IBOutlet weak var chlsCount: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSColor(calibratedWhite: 0.8 , alpha: 0.8).set()
//        __NSRectFillUsingOperation(dirtyRect, NSCompositingOperation.sourceOver)
    }
    
}
