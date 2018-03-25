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
class MusicPlayer {
    let audioPlayer:STKAudioPlayer = STKAudioPlayer()
    var index=0
    var channelId=1
    var playlist:Playlist_Base?
    var albumImageView: NSImageView?
    var title: NSTextField?
    init(channelId:Int=1){
        self.index=0
        self.channelId = channelId
        resetChannelId(channelId: channelId)
        let timer=Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                       selector: #selector(tick), userInfo: nil, repeats: true)
    }
    func setImageVIew(albumImageView:NSImageView){
        self.albumImageView=albumImageView
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
    }
    func pauseSong(){
        self.audioPlayer.pause()
    }
    func playSong(){
        self.audioPlayer.resume()
    }
    func playNextSong(){
        if let songs=playlist?.song{
            self.audioPlayer.play(songs[index%songs.count].url!)
            let url = URL(string: (songs[index%songs.count].picture)!)!
            print (url)
            self.albumImageView?.kf.setImage(with: url)
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
        self.channelId=channelId
        self.audioPlayer.stop()
        self.audioPlayer.clearQueue()
        refreshList()
    }
}
