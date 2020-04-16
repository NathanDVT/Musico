//
//  HomeBoardVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary
import FirebaseAnalytics
import Crashlytics

class HomeBoardVC: UIViewController, DashboardViewControllerProtocol, UITabBarControllerDelegate {
    @IBOutlet var trendingButtons: [UIButton]!
    func successfulTrendingArtists(trendingArtists: [TrendingArtistModel]) {
        DispatchQueue.main.async {
            for iterator in 0..<trendingArtists.count {
                self.trendingButtons[iterator]
                    .setTitle("\(trendingArtists[iterator].artistName)- \(trendingArtists[iterator].tally)", for: .normal)
            }
        }
    }

    @IBAction func postTrending(_ sender: UIButton) {
        viewModel.postTrendingSong(index: trendingButtons.firstIndex(of: sender)!)
    }

    func successFulSongRequests(songs: [RecentSong]) {
        for iterator in 0..<arrayRecentButtons.count {
            arrayRecentButtons[iterator]
                .setTitle("\(songs[iterator].artistName)- \(songs[iterator].titleName)", for: .normal)
        }
    }

    @IBOutlet weak var homeUIButton: UITabBarItem!
    func successFulNameRequest(name: String) {
        userNameLabel.text = name
    }

    @IBAction func playPauseUIButton(_ sender: Any) {
        viewModel.pauseOrPlayCurrentSong()
    }

    func setCurrentControlIcon(img: UIImage) {
        currentControlUIButton.setBackgroundImage(img, for: .normal)
    }

    func setSongTitle(title: String) {
        currentSongTitleUILabel.text = title
    }

    @IBOutlet weak var currentControlUIButton: UIButton!
    @IBOutlet weak var currentSongTitleUILabel: UILabel!
    @IBOutlet var arrayRecentButtons: [UIButton]!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var userNameLabel: UILabel!

    lazy var viewModel: DashboardViewModelProtocol = DashboardViewModel(viewController: self, repo: DashboardRepo())
    @IBOutlet var homeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let layer = CAGradientLayer()
//        layer.frame = homeView.bounds
//        let objcObj: HexToUIColor = HexToUIColor(hexcode: "#939393ff")
//        let hexGenCol: UIColor = objcObj.color
//        layer.colors = [UIColor.systemYellow.cgColor, UIColor.black.cgColor,
//                        hexGenCol.cgColor]
//        layer.locations = [0.0, 0.095, 0.97]
//        homeView.backgroundColor = .none
//        homeView.layer.insertSublayer(layer, at: 0)

        loadDashBoardContent()
        viewModel.getTrending()
    }

    public func loadDashBoardContent() {
        viewModel.loadContent()
    }

    @IBAction func userLogout(_ sender: Any) {
        let dialogMessage = UIAlertController(title: "Logging Out",
                                              message: "Are you sure you want log out?",
                                              preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                               style: .default,
                               handler: { (_) -> Void in
             print("Ok button tapped")
            self.viewModel.logoutRequest()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) -> Void in
        }
        dialogMessage.addAction(okAction)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
        viewModel.logoutRequest()
    }

    @IBAction func selectedRecentSong(_ sender: UIButton) {
        Analytics.logEvent("played_recent_song", parameters: nil)
        viewModel.playRecentSongAt(index: arrayRecentButtons.firstIndex(of: sender)!)
    }

    public func successfulLogout() {
        Analytics.logEvent("user_logged_out", parameters: nil)
        let storyboard = UIStoryboard(name: "EntryBoard", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "EntryBoardLoginID") as UIViewController
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
            present(destinationVC, animated: true, completion: nil)
    }
}
