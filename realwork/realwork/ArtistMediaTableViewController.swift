//
//  ArtistMediaTableViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/19.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import AVKit
import NLibrary

class ArtistMediaTableViewController: UITableViewController,
SeearchMusicTableViewControllerProtocol, RecentViewControllerProtocol {
    func successfulRequest() {
        self.listOfArtistCollections = self.artistMediaViewModel.getSongs()
    }

    func unsuccessfulRequest(errorMessage: String) {

    }

    var player: AVPlayer?
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchTitleIndex = 0
    var listOfArtistCollections = [SearchSongDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // TO DO: this should use a protocol
    lazy var artistMediaViewModel: SearchSongsViewModel = SearchSongsViewModel(view: self, repo: SearchSongRepo())

    lazy var recentViewModel: RecentViewModelProtocol = RecentViewModel(view: self, repo: RecentRepo())

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.registerTableViewCells()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfArtistCollections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.searchTitleIndex == 0 {
            return instantiateArtistMusicCell( tableView, cellForRowAt: indexPath)
        } else {
            return instantiateVideoCell(tableView, cellForRowAt: indexPath)
        }
    }

    func instantiateVideoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            "ArtistVideoTableViewCell", for: indexPath) as? ArtistVideoTableViewCell else {
            return UITableViewCell()
        }
        // Configure the cell...
        cell.nameLbl.text = listOfArtistCollections[indexPath.row].artistName
        cell.titleLbl.text = listOfArtistCollections[indexPath.row].collectionName
        guard let imageURL = URL(string: listOfArtistCollections[indexPath.row].artworkUrl60) else {
            return cell
        }
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.imgView.image = image
            }
        }
        return cell
    }

    func instantiateArtistMusicCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        // Configure the cell...
        cell.nameLbl.text = listOfArtistCollections[indexPath.row].artistName
        cell.titleLbl.text = listOfArtistCollections[indexPath.row].collectionName
        cell.durationLbl.text = listOfArtistCollections[indexPath.row].titleName
        guard let imageURL = URL(string: listOfArtistCollections[indexPath.row].artworkUrl60) else {
            return cell
        }
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.imgView.image = image
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let important = importantAction(at: indexPath, then: tableView)
        return UISwipeActionsConfiguration(actions: [important])
    }

    func importantAction(at indexPath: IndexPath, then tableView: UITableView) -> UIContextualAction {
        let cell = tableView.cellForRow(at: indexPath) as? TableCell
        let description: String = cell?.tblcellplayer != nil && cell!.isPlaying() ? "PAUSE" : "PLAY"
        let action = UIContextualAction(style: .normal, title: description) { ( _, _, completion) in
            let url  = URL.init(string: self.listOfArtistCollections[indexPath.row].previewUrl)
            let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
            if self.player == nil {
                self.player = AVPlayer(playerItem: playerItem)
            }
//            let playerLayer = AVPlayerLayer(player: self.player!)
//            playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
            let cell = tableView.cellForRow(at: indexPath) as? TableCell
            let img = UIImage(systemName: "livephoto.play")
            cell?.playBtn.tintColor = UIColor.yellow
            cell?.playBtn.setImage(img, for: .normal)
            cell?.tblcellplayer = self.player
            cell?.musicPlayed()
            if cell?.isPlaying() ?? false {
                self.artistMediaViewModel.addToRecentSongs(songIndex: indexPath.row)
            }
            completion(true)
        }
        if cell?.isPlaying() ?? true {
            action.backgroundColor = .red
        } else {
            action.backgroundColor = .systemYellow
        }
        action.image = UIImage(systemName: "livephoto.play")
        return action
    }

    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "ArtistVideoTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "ArtistVideoTableViewCell")
    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle:
     UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

extension ArtistMediaTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        self.artistMediaViewModel.getCollections(artistName: searchBarText)
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            self.searchTitleIndex = selectedScope
        case 1:
            self.searchTitleIndex = selectedScope
        default:
            print("Error")
        }
        self.tableView.reloadData()
    }
}
