//
//  ChannelItem.swift
//  DouBanFM
//
//  Created by lizhuo on 5/6/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Cocoa
protocol ClickDelegate:NSObjectProtocol{
    func changeChannel(id:Int)
}

class ChannelItem: NSCollectionViewItem {
    weak var delegate:ClickDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
//        let blurEffect = NSBlurEffect(style: NSBlurEffectStyle.Light)
//        let blurView = NSVisualEffectView(effect: blurEffect)
//        blurView.frame = imageView.bounds
//        imageView?.addSubview(blurView)
        imageView?.wantsLayer=true
        imageView?.layer?.cornerRadius=2
        imageView?.layer?.backgroundColor=NSColor(deviceRed:1, green:1, blue:1, alpha:0.50).cgColor
    }
    override var isSelected: Bool {
        didSet {
            imageView?.layer?.backgroundColor = isSelected ? NSColor.green.cgColor : NSColor(deviceRed:1, green:1, blue:1, alpha:0.50).cgColor
            if isSelected{
                print(chls!.name)
                if delegate != nil{
                    delegate?.changeChannel(id:(chls?.id)!)
                }
            }
        }
    }
    var chls: Chls? {
        didSet {
            print(chls?.name,chls?.id)
            guard isViewLoaded else { return }
            if let chls = chls {
                textField?.stringValue = chls.name!
            }
        }
    }
    
}
