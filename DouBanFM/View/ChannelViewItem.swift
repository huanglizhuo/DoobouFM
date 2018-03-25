//
//  ChannelViewItem.swift
//  DouBanFM
//
//  Created by lizhuo on 3/25/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Cocoa

class ChannelViewItem: NSCollectionViewItem {
    @IBOutlet weak var name: NSTextField!
    var channelName: String? {
        didSet {
            guard isViewLoaded else { return }
            if let channelName = channelName {
                textField?.stringValue = channelName
                name.stringValue=channelName
            } else {
                textField?.stringValue = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
//        view.layer?.borderColor = NSColor.black.cgColor
//        view.layer?.borderWidth = 5.0
    }
    override var isSelected: Bool {
        didSet {
            view.layer?.borderWidth = isSelected ? 5.0 : 0.0
            print("dfdfsdfs")
        }
    }
    
}
