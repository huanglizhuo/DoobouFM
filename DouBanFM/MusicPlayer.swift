//
//  MusicPlayer.swift
//  DouBanFM
//
//  Created by lizhuo on 3/21/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Foundation
import StreamingKit
import Kingfisher

protocol MusicProgressDelegate:NSObjectProtocol{
    func updateProgress(incresment:Double,duration:Double)
}
class MusicPlayer {
    let audioPlayer:STKAudioPlayer = STKAudioPlayer()
    var index=0
    weak var delegate:MusicProgressDelegate?
    var channelId=17
    var playlist:Playlist_Base?{
        didSet {
            if playlist?.song?.count==0 {
                refreshList()
                //avoid playlist songs equal zero 
            }
        }
    }
    var albumImageView: NSImageView?
    var songTitle:NSTextField?
    var playing:Bool
    var title: NSTextField?
    let preferences = UserDefaults.standard
    let channelIDKey = "channelID"
    init(){
        self.index=0
        self.playing=false
        if preferences.object(forKey: channelIDKey) == nil {
            self.channelId=17
        } else {
            self.channelId = preferences.integer(forKey: channelIDKey)
            print("last channelid",channelId)
        }
        resetChannelId(channelId: channelId)
        let timer=Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                       selector: #selector(tick), userInfo: nil, repeats: true)
        initChannel();
    }
    func initChannel(){
        
    }
    func setImageVIew(albumImageView:NSImageView){
        self.albumImageView=albumImageView
    }
    func setSongTitle(songTitle:NSTextField){
        self.songTitle=songTitle
    }
    
    func setTitle(title: NSTextField){
        self.title=title
    }
    func setPlayOrPause(playOrpause: NSButtonCell){
        
    }
    @objc func tick(){
        if self.audioPlayer.progress==0{
            self.playNextSong()
        }
        delegate?.updateProgress(incresment: 0.1,duration:audioPlayer.duration)
    }
    func pauseSong(){
        self.playing=false
        self.audioPlayer.pause()
    }
    func playSong(){
        self.playing=true
        self.audioPlayer.resume()
    }
    func playNextSong(){
        if playlist?.song?.count==0 {
            refreshList()
            return
        }
        if let songs=playlist?.song{
            self.playing=true
            self.audioPlayer.play(songs[index%songs.count].url!)
            let url = URL(string: (songs[index%songs.count].picture)!)!
            self.albumImageView?.kf.setImage(with: url)
            self.songTitle?.stringValue=songs[index%songs.count].title!
            self.index+=1
            self.index=self.index%songs.count
            if index==songs.count-1{
                refreshList()
            }
        }else{
            refreshList()
        }
    }
    func refreshList(){
        DouBan.reqPlaylist(channel: String(self.channelId)) { (playlist) in
            self.playlist=playlist
            self.index=0;
            for song in playlist.song!{
                self.audioPlayer.queue(song.url!)
            }
        }
    }
    func resetChannelId(channelId:Int=1){
        preferences.set(channelId, forKey: channelIDKey)
        preferences.synchronize()
        print("last channelid",channelId)
        self.channelId=channelId
        self.audioPlayer.stop()
        self.audioPlayer.clearQueue()
        refreshList()
    }
}
