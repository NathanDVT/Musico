//
//  PlaylistDetailViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/22.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class PlaylistDetailViewController: UIViewController {
    @IBOutlet weak var songTableView: UITableView!
    @IBOutlet weak var producerNameUILabel: UILabel!
    @IBOutlet weak var playlistNameUILabel: UILabel!
    @IBOutlet weak var playlistPicUIImage: RoundedWhiteBorderImageView!
    var selectedPlaylist: PlaylistModel?
    var songs = [BasicSongItem]() {
        didSet {
            DispatchQueue.main.async {
                self.songTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.songTableView.dataSource = self
        self.songTableView.delegate = self
        self.displayContent()
        self.songTableView.reloadData()
        // Do any additional setup after loading the view.
    }

    func displayContent() {
        producerNameUILabel.text = self.selectedPlaylist?.producerEmail
        playlistNameUILabel.text = self.selectedPlaylist?.playlistName
    }
}

extension PlaylistDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPlaylist!.basicSongItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell",
                                                       for: indexPath) as? PlaylistTableViewCell else {
            return UITableViewCell()
        }
        cell.nameUILabel.text = "\(selectedPlaylist!.basicSongItems[indexPath.row].songTitle)"
        cell.numSongsUILabel.text = "Number of songs: \(selectedPlaylist!.basicSongItems[indexPath.row].songTitle)"
        guard let imageURL = URL(string: selectedPlaylist!.basicSongItems[indexPath.row].artworkUrl60) else {
            return cell
        }
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.artWorkImage.image = image
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TO DO: Music play action
    }
}
