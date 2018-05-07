//
//  MainWindowController.swift
//  DouBanFM
//
//  Created by lizhuo on 3/20/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    override func windowDidLoad() {
        super .windowDidLoad()
        if let window = self.window {
            let button = window.standardWindowButton(NSWindow.ButtonType.zoomButton)
            button?.isHidden = true
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
//            window.title="hello"
            window.styleMask.remove([.resizable])
        }
    }
}
