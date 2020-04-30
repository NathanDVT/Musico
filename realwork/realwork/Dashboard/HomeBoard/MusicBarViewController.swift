//
//  MusicBarViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary
import WatchConnectivity

class MusicBarViewController: UIViewController {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet var curvedView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    var musicControllerViewModel: MusicBarViewModel?
    var session: WCSession?
    override func viewDidLoad() {
        super.viewDidLoad()

        curvedView.clipsToBounds = true
        curvedView.layer.cornerRadius = 40
        curvedView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        songTitle.text = musicControllerViewModel?.name
        self.configureWatchKitSesstion()
        // Do any additional setup after loading the view.
    }
    @IBAction func playOrPause(_ sender: Any) {
        musicControllerViewModel?.pauseOrPlayCurrentSong()
        updateBarContent()
        sendToWatch()
    }

    func sendToWatch() {
        if let validSession = self.session, validSession.isReachable {
            var colorIndex: Int = 0
            for colIndex in 0..<GraphicColors.primaryCodes.count {
                let col: String = GraphicColors.primaryCodes[colIndex]
                if compareColors(co1: HexToUIColor(hexcode: col).color, co2: GraphicColors.primary) {
                    colorIndex = colIndex
                }
            }
            let data: [String: Any] = ["iPhone": musicControllerViewModel?.name as Any,
                                       "color": colorIndex] // Create your Dictionay as per uses
            validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
        }
    }

    func configureWatchKitSesstion() {
      if WCSession.isSupported() {//4.1
        session = WCSession.default//4.2
        session?.delegate = self//4.3
        session?.activate()//4.4
      }
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
        sendToWatch()
    }
}

extension MusicBarViewController: WCSessionDelegate {

  func sessionDidBecomeInactive(_ session: WCSession) {
  }

  func sessionDidDeactivate(_ session: WCSession) {
  }

  func session(_ session: WCSession,
               activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
  }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async { //6
            if message["watch"] != nil {
                self.musicControllerViewModel?.pauseOrPlayCurrentSong()
                self.updateBarContent()
            }
        }
    }
}
