//
//  ViewController.swift
//  DouBanFM
//
//  Created by lizhuo on 3/19/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Cocoa
import Alamofire
import StreamingKit
import Kingfisher
import Foundation
class ViewController: NSViewController,ClickDelegate {

    @IBOutlet weak var musicPlayerView: MusicPlayerView!
    @IBOutlet weak var albumView: NSImageView!
    @IBOutlet weak var channelCollection: NSCollectionView!
    var selectDelegate:ClickDelegate?
    var channelsList:Channels_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musicPlayerView.setAlbumImageView(albumImageView: self.albumView)
        initColection()
        DouBan.reqChannels(){(channelsList) in
            self.channelsList=channelsList
            self.channelsList?.groups?.remove(at: 0)
            //删除我的私人频道
            let floverChannels = self.channelsList?.groups![3]
            self.channelsList?.groups?.remove(at: 3)
            self.channelsList?.groups?.insert(floverChannels!, at: 0)
            self.channelCollection.dataSource=self
        }
    }
    
    func initColection(){
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 80, height: 30)
        flowLayout.sectionInset = NSEdgeInsets(top: 5, left: 3, bottom: 5, right: 3)
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 8
        channelCollection.collectionViewLayout = flowLayout
        channelCollection.isSelectable = true
        channelCollection.backgroundColors = [NSColor.clear]
        channelCollection.allowsEmptySelection = true
        view.wantsLayer = true
    }
    func changeChannel(id: Int) {
        self.musicPlayerView.resetChannelId(id: id)
    }
    override func keyUp(with event: NSEvent) {
        if event.keyCode == 49{
            self.musicPlayerView.playOrPause()
        }
    }
    override func awakeFromNib() {
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {_ in
                return nil
            //remove the error sound actually i don't know why this works
        }
    }
}

extension ViewController : NSCollectionViewDataSource {
    
    // 1
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        let sectionsCount=(channelsList?.groups?.count)!
        return sectionsCount
    }
    
    // 2
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return (channelsList?.groups![section].chls!.count)!
    }
    
    // 3
    func collectionView(_ itemForRepresentedObjectAtcollectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        // 4
        let item = channelCollection.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ChannelItem"), for: indexPath)
        guard let channelCollection = item as? ChannelItem else {return item}
        // 5
        let channelname = channelsList?.groups![indexPath.section].chls![indexPath.item]
        channelCollection.chls = channelname
        channelCollection.delegate = self
        return item
    }
//    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> NSView {
//        // 1
//        let view = channelCollection.makeSupplementaryView(ofKind: NSCollectionView.SupplementaryElementKind.sectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "GroupHeaderView"), for: indexPath) as! GroupHeaderView
//        // 2
//        view.groupName.stringValue = (channelsList?.groups![indexPath.section].group_name)!
//        let numberOfItemsInSection = channelsList?.groups![indexPath.section].chls?.count
//        view.chlsCount.stringValue = String(describing: numberOfItemsInSection)
//        return view
//    }
}
