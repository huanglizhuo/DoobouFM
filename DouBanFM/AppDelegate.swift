//
//  AppDelegate.swift
//  DouBanFM
//
//  Created by lizhuo on 3/19/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Cocoa
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let popover = NSPopover()
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let icon = NSImage(named:NSImage.Name("statusIcon"))
        icon?.isTemplate = true
        statusItem.image = icon
//        if let button = statusItem.button {
//            button.action = #selector(printQuote(_:))
//        }        
//        let menu = NSMenu()
//        menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote(_:)), keyEquivalent: "P"))
//        statusItem.menu = menu
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    @IBAction func viewInGuthub(_ sender: Any) {
        NSWorkspace.shared.open(URL.init(string: "https://github.com/huanglizhuo/DoobouFM")!)
    }
}

