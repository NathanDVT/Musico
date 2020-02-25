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
    var tblcellplayer: AVPlayer!
    @IBAction func musicActionPressed(_ sender: Any) {
        guard let tblcellplayer = tblcellplayer else {
            return
        }
        if isPlaying() {
            tblcellplayer.pause()
            playBtn.setImage(UIImage(systemName: "livephoto.slash"), for: .normal)
        } else {
            tblcellplayer.play()
            playBtn.setImage(UIImage(systemName: "livephoto.play"), for: .normal)
        }
    }

    func isPlaying() -> Bool {
        return (self.tblcellplayer.rate != 0 && self.tblcellplayer.error == nil)
    }
}
