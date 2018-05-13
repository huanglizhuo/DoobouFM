//
//  MusicPlayerView.swift
//  DouBanFM
//
//  Created by lizhuo on 5/13/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Cocoa
import StreamingKit

class MusicPlayerView: NSView , MusicProgressDelegate{

    @IBOutlet var contentView: NSView!
    @IBOutlet weak var playButton: NSButton!
    @IBOutlet weak var nextButton: NSButton!
    @IBOutlet weak var songTitle: NSTextField!
    @IBOutlet weak var songNameBg: NSImageView!
    @IBOutlet weak var songProgressBar: NSProgressIndicator!
    
    var progressDelegatte:MusicProgressDelegate?
    var musicPlayer = MusicPlayer.sharedMusicInstance
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed(NSNib.Name(rawValue: "MusicPlayerView"), owner: self, topLevelObjects: nil)
        addSubview(contentView)
        contentView.frame=self.bounds
        self.musicPlayer = MusicPlayer.sharedMusicInstance
        self.playButton.appearance = NSAppearance(named: NSAppearance.Name.aqua)
        self.playButton.image = musicPlayer.audioPlayer.state==STKAudioPlayerState.playing ?#imageLiteral(resourceName: "play"):#imageLiteral(resourceName: "pause")
        self.songNameBg.wantsLayer=true
        self.songNameBg?.layer?.backgroundColor = NSColor(deviceRed:1, green:1, blue:1, alpha:0.50).cgColor
        self.musicPlayer.setSongTitle(songTitle: songTitle)
        self.musicPlayer.delegate = self

    }
    
    func setAlbumImageView(albumImageView:NSImageView){
        img2CircleImg(image: albumImageView)
        self.musicPlayer.setImageVIew(albumImageView: albumImageView)
    }
    func updateProgress(incresment: Double,duration:Double) {
        songProgressBar.increment(by: incresment)
        songProgressBar.maxValue=duration
    }
    
    func img2CircleImg(image:NSImageView)  {
        image.wantsLayer=true
        image.layer?.backgroundColor = NSColor.white.cgColor
        image.layer?.cornerRadius = image.frame.width/2
        image.layer?.masksToBounds = true
    }
    
    func resetChannelId(id: Int){
        self.musicPlayer.resetChannelId(channelId: id)
    }
    
    @IBAction func playOrPauseClick(_ sender: NSButton) {
        playOrPause()
    }
    
    func playOrPause(){
        if musicPlayer.audioPlayer.state==STKAudioPlayerState.playing{
            self.playButton.image=#imageLiteral(resourceName: "play")
            self.musicPlayer.pauseSong()
        }else{
            self.playButton.image = #imageLiteral(resourceName: "pause")
            self.musicPlayer.playSong()
        }
    }
    @IBAction func nextClick(_ sender: Any) {
        let url = URL(string: (musicPlayer.playlist?.song![musicPlayer.index].picture)!)!
        print (url)
        self.musicPlayer.playNextSong()
    }
}
