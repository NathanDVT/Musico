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
    var musicControllerViewModel: MusicBarViewModel? { get set }
}

class HomeBoardVC: UIViewController, DashboardViewControllerProtocol, UITabBarControllerDelegate, MusicControllable {
    var musicBarViewController: MusicBarViewController?
    @IBOutlet var arrayRecentButtons: [UIButton]!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var trendingButtons: [UIButton]!
    @IBOutlet var trendingTiles: [ReusableTrendingTile]!
    var trendingArtists: [TrendingArtistModel] = []
    var musicControllerViewModel: MusicBarViewModel?
    var songs: [RecentSong]?
    @IBOutlet weak var testing: UILabel!
    @IBOutlet weak var homeUIButton: UITabBarItem!
    let gesture = UITapGestureRecognizer(target: self, action: Selector(("postTrending:")))
    lazy var viewModel: DashboardViewModelProtocol = DashboardViewModel(viewController: self, repo: DashboardRepo())
    @IBOutlet var homeView: UIView!

    func successfulTrendingArtists(trendingArtists: [TrendingArtistModel]) {
        self.trendingArtists = trendingArtists
        DispatchQueue.main.async {
            for (artist, button) in zip(trendingArtists, self.trendingTiles) {
                button.populateFields(trendingArtist: artist)
            }
        }
    }

    @objc func postTrending2(_ sender: UITapGestureRecognizer) {
        viewModel.postTrendingSong(index: sender.view!.tag)
    }

    func successFulSongRequests(songs: [RecentSong]) {
        for (song, button) in zip(songs, arrayRecentButtons) {
            button.setTitle("\(song.artistName)- \(song.titleName)", for: .normal)
        }
        self.songs = songs
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDashBoardContent()
        viewModel.getTrending()
        for index in trendingTiles.indices {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.postTrending2(_:)))
            trendingTiles[index].isUserInteractionEnabled = true
            trendingTiles[index].tag = index
            trendingTiles[index].addGestureRecognizer(tap)
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
