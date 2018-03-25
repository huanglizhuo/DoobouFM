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
class ViewController: NSViewController {
    @IBOutlet weak var channelId: NSTextField!
    @IBOutlet weak var albumImageView: NSImageView!
    @IBOutlet weak var playOrpause: NSButtonCell!
    @IBOutlet weak var channelCollection: NSCollectionView!
    
    let musicPlayer = MusicPlayer(channelId: 17)
    var channelsList:Channels_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playOrpause.image = musicPlayer.audioPlayer.state==STKAudioPlayerState.playing ?#imageLiteral(resourceName: "play"):#imageLiteral(resourceName: "pause")
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                     selector: #selector(tick), userInfo: nil, repeats: true)
        self.musicPlayer.setImageVIew(albumImageView: albumImageView)
        
        initColection()
        DouBan.reqChannels(){(channelsList) in
            self.channelsList=channelsList
            self.channelCollection.dataSource=self
//            self.channelCollection.delegate=self
        }
    }
    override var representedObject: Any? {
        didSet {
        }
    }
    func initColection(){
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 70, height: 40)
        flowLayout.sectionInset = NSEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        channelCollection.collectionViewLayout = flowLayout
        channelCollection.isSelectable = true
        channelCollection.allowsEmptySelection = true
        view.wantsLayer = true
    }
    @objc func tick(){
//        print("time: ", self.musicPlayer.playlist?.song?.count)
    }
    @IBAction func helloButton(_ sender: NSButton) {
        let url = URL(string: (musicPlayer.playlist?.song![musicPlayer.index].picture)!)!
        print (url)
        self.musicPlayer.playNextSong()
    }

    @IBAction func changeChannel(_ sender: NSButton) {
        if let id=Int(channelId.stringValue){
            musicPlayer.resetChannelId(channelId: id)
        }
    }
    @IBAction func pauseClick(_ sender: NSButton) {
        if musicPlayer.audioPlayer.state==STKAudioPlayerState.playing{
            sender.image=#imageLiteral(resourceName: "play")
            self.musicPlayer.pauseSong()
        }else{
            sender.image = #imageLiteral(resourceName: "pause")
            self.musicPlayer.playSong()
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
        let item = channelCollection.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ChannelViewItem"), for: indexPath)
        guard let collectionViewItem = item as? ChannelViewItem else {return item}
        // 5
        print(indexPath.section,indexPath.item)
        let imageFile = channelsList?.groups![indexPath.section].chls![indexPath.item].name
        collectionViewItem.channelName = imageFile
        return item
    }
    func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> NSView {
        // 1
        let view = channelCollection.makeSupplementaryView(ofKind: NSCollectionView.SupplementaryElementKind.sectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "GroupHeaderView"), for: indexPath) as! GroupHeaderView
        // 2
        view.groupName.stringValue = (channelsList?.groups![indexPath.section].group_name)!
        let numberOfItemsInSection = channelsList?.groups![indexPath.section].chls?.count
        view.chlsCount.stringValue = String(describing: numberOfItemsInSection)
        return view
    }
}
extension ViewController : NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: 1000, height: 40)
    }
}
