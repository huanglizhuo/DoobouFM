//
//  MediaApplication.swift
//  DouBanFM
//
//  Created by lizhuo on 3/31/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Cocoa

@objc(MediaApplication)
class MediaApplication: NSApplication {
    override func sendEvent(_ event: NSEvent) {
        if (event.type == .systemDefined && event.subtype.rawValue == 8) {
            let keyCode = ((event.data1 & 0xFFFF0000) >> 16)
            let keyFlags = (event.data1 & 0x0000FFFF)
            // Get the key state. 0xA is KeyDown, OxB is KeyUp
            let keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA
            let keyRepeat = (keyFlags & 0x1)
            let rep = keyRepeat==0 ?true:false
            mediaKeyEvent(key: Int32(keyCode), state: keyState, keyRepeat: rep)
        }else{
            super.sendEvent(event)
        }
    }
    
    func mediaKeyEvent(key: Int32, state: Bool, keyRepeat: Bool) {
        // Only send events on KeyDown. Without this check, these events will happen twice
        if (state) {
            switch(key) {
            case NX_KEYTYPE_PLAY:
                print("Play")
                break
            case NX_KEYTYPE_FAST:
                print("Next")
                break
            case NX_KEYTYPE_REWIND:
                print("Prev")
                break
            default:
                break
            }
        }
    }
}
