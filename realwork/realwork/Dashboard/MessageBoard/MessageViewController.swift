//
//  MessageViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/05.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import Crashlytics
import NLibrary

class MessageViewController: UIViewController, MusicControllable {
    var musicBarViewController: MusicBarViewController?
    var musicControllerViewModel: MusicControllerViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func crashAction(_ sender: Any) {
//        Crashlytics.sharedInstance().crash()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InboxToMusicBar" {
            guard let destVC = segue.destination as? MusicBarViewController else {
                return
            }
            self.musicBarViewController = destVC
            self.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
        }
    }

}
