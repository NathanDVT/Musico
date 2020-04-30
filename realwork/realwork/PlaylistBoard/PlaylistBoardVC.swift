//
//  PlaylistBoardVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/31.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class PlaylistBoardVC: UIViewController, PlaylistViewControllerProtocol, MusicControllable {
    var musicControllerViewModel: MusicBarViewModel?
    var musicBarViewController: MusicBarViewController?
    @IBOutlet weak var playlistTableView: UITableView!
    var selectedPlaylist: PlaylistModel?
    var destination: PlaylistDetailViewController?
    lazy var viewModel: PlaylistViewModel = PlaylistViewModel(view: self, repo: PlaylistRepo())
    var playlistModels = [PlaylistModel]() {
        didSet {
            DispatchQueue.main.async {
                self.playlistTableView.separatorColor = GraphicColors.secondary
                self.playlistTableView.reloadData()
            }
        }
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    func successfulRequest(playlistModels: [PlaylistModel]) {
        self.playlistModels = playlistModels
        activityIndicator.stopAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTableView.separatorColor = GraphicColors.secondary
        viewModel.requestUserPlaylistDetails()
        self.playlistTableView.reloadData()
    }

    @IBAction func createPlaylist(_ sender: Any) {
        let alertController = UIAlertController(title: "Create Playlist",
                                                message: "Please Enter the new playlists name",
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField: UITextField) -> Void in
                    textField.placeholder = "playlist name"
                }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: UIAlertAction.Style.cancel) { (_: UIAlertAction) -> Void in
        }

        let okAction = UIAlertAction(title: "OK",
                                     style: UIAlertAction.Style.default) { [weak self] (_: UIAlertAction) -> Void in
                                        guard let playListName: String = alertController.textFields?.first?.text! else {
                                            return
                                        }
                                        self?.createPlaylist(playListName: playListName)
                }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func createPlaylist(playListName: String) {
        viewModel.createPlaylist(playlistName: playListName)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaylistsToMusicBar" {
            guard let destVC = segue.destination as? MusicBarViewController else {
                return
            }
            self.musicBarViewController = destVC
            self.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
        }
        if segue.identifier == "PlaylistsToPlaylistViewer" {
            guard let destVC = segue.destination as? PlaylistDetailViewController else {
                return
            }
            self.destination = destVC
            self.destination?.musicBarViewController = self.musicBarViewController
            self.destination?.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
            self.destination?.musicControllerViewModel = self.musicControllerViewModel
            self.destination!.musicBarViewController!.updateBarContent()
        }
    }
}

extension PlaylistBoardVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell",
                                                       for: indexPath) as? PlaylistTableViewCell else {
            return UITableViewCell()
        }
        cell.nameUILabel.text = "\(playlistModels[indexPath.row].playlistName)"
        cell.numSongsUILabel.text = "Number of songs: \(playlistModels[indexPath.row].numSongs)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        destination?.selectedPlaylist = self.playlistModels[indexPath.row]
        self.destination?.musicBarViewController = self.musicBarViewController
        self.destination?.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
        self.destination?.musicControllerViewModel = self.musicControllerViewModel
        self.destination!.musicBarViewController!.updateBarContent()
    }
}
