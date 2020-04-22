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

protocol MusicControllable {
    var musicBarViewController: MusicBarViewController? { get set }
    var musicControllerViewModel: MusicControllerViewModel? { get set }
}

class HomeBoardVC: UIViewController, DashboardViewControllerProtocol, UITabBarControllerDelegate, MusicControllable {
    func successfulLogout() {

    }

    @IBOutlet var trendingButtons: [UIButton]!
    @IBOutlet var trendingTiles: [ReusableTrendingTile]!
    var musicControllerViewModel: MusicControllerViewModel?
    var songs: [RecentSong]?
    @IBOutlet weak var testing: UILabel!
    @IBOutlet weak var homeUIButton: UITabBarItem!
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
        self.songs = songs
    }

    @IBOutlet var arrayRecentButtons: [UIButton]!
    @IBOutlet var buttonCollection: [UIButton]!

    lazy var viewModel: DashboardViewModelProtocol = DashboardViewModel(viewController: self, repo: DashboardRepo())
    @IBOutlet var homeView: UIView!
    var musicBarViewController: MusicBarViewController?
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

    @IBAction func selectedRecentSong(_ sender: UIButton) {
        Analytics.logEvent("played_recent_song", parameters: nil)
        guard let index = arrayRecentButtons.firstIndex(of: sender) else {
            return
        }
        if let song: RecentSong = songs?[index] {
            self.musicControllerViewModel?.playFromUrlWithTitle(urlString: song.previewUrl,
                                                       title: "\(song.artistName) - \(song.titleName)")
            self.musicBarViewController?.updateBarContent()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFirstChild" {
            guard let destVC = segue.destination as? MusicBarViewController else {
                return
            }
            self.musicBarViewController = destVC
            self.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
        }
    }
}
