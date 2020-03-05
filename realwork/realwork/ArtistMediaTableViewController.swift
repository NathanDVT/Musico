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

class ArtistMediaTableViewController: UITableViewController {
    var listOfArtistCollections = [Collection]() {
        didSet {
            DispatchQueue.main.async {
                print ("reset values")
                self.tableView.reloadData()
            }
        }
    }
    var player: AVPlayer!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfArtistCollections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableCell else {
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

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let important = importantAction(at: indexPath, then: tableView)
        return UISwipeActionsConfiguration(actions: [important])
    }

    func importantAction(at indexPath: IndexPath, then tableView: UITableView) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "PLAY") { ( _, _, completion) in
            let url  = URL.init(string: self.listOfArtistCollections[indexPath.row].previewUrl)
            let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
            self.player = AVPlayer(playerItem: playerItem)
            let playerLayer = AVPlayerLayer(player: self.player!)
            playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
            self.view.layer.addSublayer(playerLayer)
            self.player.play()
            let cell = tableView.cellForRow(at: indexPath) as? TableCell
            let action = UIImage(systemName: "livephoto.play")
            cell?.playBtn.tintColor = UIColor.yellow
            cell?.playBtn.setImage(action, for: .normal)
            cell?.tblcellplayer = self.player
            completion(true)
        }
        action.image = UIImage(systemName: "livephoto.play")
        return action
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
        let artistMediaViewModel = ArtistMediaViewModel(artistName: searchBarText)
        artistMediaViewModel.getCollections{ [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let collections):
                self?.listOfArtistCollections = collections
            }
        }
    }
}
