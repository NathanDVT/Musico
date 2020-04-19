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
    @IBOutlet var trendingTiles: [ReusableTrendingTile]!
    let gesture = UITapGestureRecognizer(target: self, action: Selector(("postTrending:")))
    func successfulTrendingArtists(trendingArtists: [TrendingArtistModel]) {
        DispatchQueue.main.async {
            for iterator in 0..<trendingArtists.count {
                self.trendingButtons[iterator]
                    .setTitle("\(trendingArtists[iterator].artistName)- \(trendingArtists[iterator].tally)",
                        for: .normal)
            }
        }
    }

    @IBAction func postTrending(_ sender: UIButton) {
        viewModel.postTrendingSong(index: trendingButtons.firstIndex(of: sender)!)
    }

    @objc func postTrending2(_ sender: UITapGestureRecognizer) {
//        let selected: ReusableTrendingTile = sender as! ReusableTrendingTile
        let selected: ReusableTrendingTile = trendingTiles[sender.view!.tag]
        viewModel.postTrendingSong(index: trendingTiles.firstIndex(of: selected)!)
    }

    func successFulSongRequests(songs: [RecentSong]) {
        for iterator in 0..<arrayRecentButtons.count {
            arrayRecentButtons[iterator]
                .setTitle("\(songs[iterator].artistName)- \(songs[iterator].titleName)", for: .normal)
        }
    }

    @IBOutlet weak var homeUIButton: UITabBarItem!

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

    lazy var viewModel: DashboardViewModelProtocol = DashboardViewModel(viewController: self, repo: DashboardRepo())
    @IBOutlet var homeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDashBoardContent()
        viewModel.getTrending()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.postTrending2(_:)))
        for index in trendingTiles.indices {
            trendingTiles[index].isUserInteractionEnabled = true
            trendingTiles[index].addGestureRecognizer(tap)
            trendingTiles[index].tag = index
        }
    }

    public func loadDashBoardContent() {
        viewModel.loadContent()
    }

    @IBAction func userLogout(_ sender: Any) {

    }

    @IBAction func selectedRecentSong(_ sender: UIButton) {
        Analytics.logEvent("played_recent_song", parameters: nil)
        viewModel.playRecentSongAt(index: arrayRecentButtons.firstIndex(of: sender)!)
    }

    public func successfulLogout() {

    }
}
