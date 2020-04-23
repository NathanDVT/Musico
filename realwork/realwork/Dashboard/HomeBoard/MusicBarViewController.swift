//
//  MusicBarViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class MusicBarViewController: UIViewController {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet var curvedView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    var musicControllerViewModel: MusicBarViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        curvedView.clipsToBounds = true
        curvedView.layer.cornerRadius = 40
        curvedView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        songTitle.text = musicControllerViewModel?.name
        // Do any additional setup after loading the view.
    }
    @IBAction func playOrPause(_ sender: Any) {
        musicControllerViewModel?.pauseOrPlayCurrentSong()
        updateBarContent()
    }

    func updateBarContent() {
        songTitle.text = musicControllerViewModel?.name
        guard let isplaying: Bool = musicControllerViewModel?.isPlaying() else {
            return
        }
        if isplaying {
            guard let img: UIImage = UIImage(systemName: "pause.circle") else {
                return
            }
            playPauseButton.setBackgroundImage(img, for: .normal)
        } else {
            guard let img: UIImage = UIImage(systemName: "play.circle") else {
                return
            }
            playPauseButton.setBackgroundImage(img, for: .normal)
        }
    }
}
