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
    var selectedPlaylist: PlaylistItemBasicModel?
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
        self.songTableView.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func testy(_ sender: Any) {
        self.songTableView.reloadData()
        self.songs = self.selectedPlaylist!.basicSongItems
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
