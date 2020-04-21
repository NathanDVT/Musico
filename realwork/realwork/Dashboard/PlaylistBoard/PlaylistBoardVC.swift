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
    var musicControllerViewModel: MusicControllerViewModel?
    func successfulRequest(songs: [PlaylistDetailModel]) {
        playlistDetails = songs
    }

    @IBOutlet weak var playlistTableView: UITableView!
    lazy var viewModel: PlaylistViewModel = PlaylistViewModel(view: self, repo: PlaylistRepo())

    var playlistDetails = [PlaylistDetailModel]() {
        didSet {
            DispatchQueue.main.async {
                self.playlistTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestUserPlaylistDetails()
        self.playlistTableView.reloadData()
        self.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
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
            //Do nothing if cancel clicked
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

    var musicBarViewController: MusicBarViewController?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaylistsToMusicBar" {
            guard let destVC = segue.destination as? MusicBarViewController else {
                return
            }
            self.musicBarViewController = destVC
            self.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
        }
    }
}

extension PlaylistBoardVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistDetails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell",
                                                       for: indexPath) as? PlaylistTableViewCell else {
            return UITableViewCell()
        }
        cell.nameUILabel.text = "\(playlistDetails[indexPath.row].name)"
        cell.numSongsUILabel.text = "Number of songs: \(playlistDetails[indexPath.row].numSongs)"
        return cell
    }
}
