//
//  TableCell.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/20.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import AVKit

class TableCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    

    @IBAction func musicActionPressed(_ sender: Any) {
//        print("pressed play")
//        var player: AVPlayer!
//        let url  = URL.init(string:   "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview118/v4/94/25/9c/94259c23-84ee-129d-709c-577186cbe211/mzaf_5653537699505456197.plus.aac.p.m4a")
//
//        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
//        player = AVPlayer(playerItem: playerItem)
//
//        let playerLayer = AVPlayerLayer(player: player!)
//
//        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
//        self.view.layer.addSublayer(playerLayer)
//        player.play()

    }



}
