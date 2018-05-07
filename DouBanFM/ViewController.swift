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
class ViewController: NSViewController,ClickDelegate,MusicProgressDelegate {

    @IBOutlet weak var musicProgressBar: NSProgressIndicator!
    @IBOutlet weak var songTitle: NSTextField!
    @IBOutlet weak var albumImageView: NSImageView!
    @IBOutlet weak var songNameBG: NSImageView!
    @IBOutlet weak var playOrpause: NSButton!
    @IBOutlet weak var channelCollection: NSCollectionView!
    var selectDelegate:ClickDelegate?
    var progressDelegatte:MusicProgressDelegate?
    let musicPlayer = MusicPlayer()
    var channelsList:Channels_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playOrpause.appearance = NSAppearance(named: NSAppearance.Name.aqua)
        self.playOrpause.image = musicPlayer.audioPlayer.state==STKAudioPlayerState.playing ?#imageLiteral(resourceName: "play"):#imageLiteral(resourceName: "pause")
        self.songNameBG.wantsLayer=true
        self.songNameBG?.layer?.backgroundColor = NSColor(deviceRed:1, green:1, blue:1, alpha:0.50).cgColor
        img2CircleImg(image: albumImageView)
        self.musicPlayer.setImageVIew(albumImageView: albumImageView)
        self.musicPlayer.setSongTitle(songTitle: songTitle)
        self.musicPlayer.delegate = self
        initColection()
        DouBan.reqChannels(){(channelsList) in
            self.channelsList=channelsList
            self.channelsList?.groups?.remove(at: 0)
            //删除我的私人频道
            let floverChannels = self.channelsList?.groups![3]
            self.channelsList?.groups?.insert(floverChannels!, at: 0)
            
            self.channelCollection.dataSource=self
        }
    }
    func img2CircleImg(image:NSImageView)  {
        image.wantsLayer=true
        image.layer?.backgroundColor = NSColor.white.cgColor
        image.layer?.cornerRadius = image.frame.width/2
        image.layer?.masksToBounds = true
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
    
    func updateProgress(incresment: Double,duration:Double) {
        musicProgressBar.increment(by: incresment)
        musicProgressBar.maxValue=duration
    }
    func changeChannel(id: Int) {
        musicPlayer.resetChannelId(channelId: id)
    }
    @IBAction func nextClick(_ sender: NSButton) {
        let url = URL(string: (musicPlayer.playlist?.song![musicPlayer.index].picture)!)!
        print (url)
        self.musicPlayer.playNextSong()
    }

    @IBAction func pauseOrPlayClick(_ sender: NSButton) {
        if musicPlayer.audioPlayer.state==STKAudioPlayerState.playing{
            sender.image=#imageLiteral(resourceName: "play")
            self.musicPlayer.pauseSong()
        }else{
            sender.image = #imageLiteral(resourceName: "pause")
            self.musicPlayer.playSong()
        }
    }
    override func keyUp(with event: NSEvent) {
        if event.keyCode == 49{
            if self.musicPlayer.playing == true{
                playOrpause.image=#imageLiteral(resourceName: "play")
                self.musicPlayer.pauseSong()
            }else{
                playOrpause.image=#imageLiteral(resourceName: "pause")
                self.musicPlayer.playSong()
            }
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
