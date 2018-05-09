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
        imageView?.layer?.cornerRadius=3
        imageView?.layer?.backgroundColor=NSColor(deviceRed:1, green:1, blue:1, alpha:0.50).cgColor
//        NSColor(deviceRed:0.3764, green:0.4705, blue:0.9176).cgColor
    }
    override var isSelected: Bool {
        didSet {
            changeBackGround(imageView: self.imageView!, isSelected: isSelected)
            if isSelected{
                print(chls!.name)
                if delegate != nil{
                    delegate?.changeChannel(id:(chls?.id)!)
                }
            }
        }
    }
    func changeBackGround(imageView:NSImageView,isSelected:Bool){
        if isSelected {
            imageView.layer?.backgroundColor = NSColor(deviceRed:0.3764, green:0.4705, blue:0.9176,alpha:0.8).cgColor
            self.textField?.textColor = NSColor(deviceRed:1, green:1, blue:1,alpha:1)
        }else{
            imageView.layer?.backgroundColor = NSColor(deviceRed:1, green:1, blue:1, alpha:0.50).cgColor
            self.textField?.textColor = NSColor(deviceRed:0, green:0, blue:0,alpha:1)
            imageView.layer?.borderWidth=0
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
