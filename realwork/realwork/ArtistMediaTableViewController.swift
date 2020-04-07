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
import FirebasePerformance

class ArtistMediaTableViewController: UITableViewController,
SeearchMusicTableViewControllerProtocol, RecentViewControllerProtocol {
    func successFulRecentSongsReceived(playlistNames: [String]) {
        pickerData = playlistNames
    }

    func successfulRequest() {
        self.listOfArtistCollections = self.searchSongsViewModel.getSongs()
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
    lazy var searchSongsViewModel: SearchSongsViewModel = SearchSongsViewModel(view: self, repo: SearchSongRepo())

    lazy var recentViewModel: RecentViewModelProtocol = RecentViewModel(view: self, repo: RecentRepo())

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.registerTableViewCells()
        self.searchSongsViewModel.getUserPlaylistNames()
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
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
        let action2 = addToPlaylistAction(at: indexPath, then: tableView)
        return UISwipeActionsConfiguration(actions: [important, action2])
    }

    func addToPlaylistAction(at indexPath: IndexPath, then tableView: UITableView) -> UIContextualAction {
                let cell = tableView.cellForRow(at: indexPath) as? TableCell
                let description: String = "ADD"
                let action = UIContextualAction(style: .normal, title: description) { [weak self] ( _, _, _) in
                    let dummyvc = UIViewController()
                    dummyvc.preferredContentSize = CGSize(width: 250, height: 300)
                    let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
                    guard let strongself = self else {
                        return
                    }
                    pickerView.delegate = strongself as UIPickerViewDelegate
                    pickerView.dataSource = strongself as UIPickerViewDataSource
                    dummyvc.view.addSubview(pickerView)
                    let editRadiusAlert = UIAlertController(title: "Choose Playlist",
                                                            message: "",
                                                            preferredStyle: UIAlertController.Style.alert)
                    editRadiusAlert.setValue(dummyvc, forKey: "contentViewController")
                    let okAction =
                        UIAlertAction(title: "Select",
                                      style: UIAlertAction.Style.default) { [weak self] (_: UIAlertAction) -> Void in
                                        let selectedValue = self?.pickerData[pickerView.selectedRow(inComponent: 0)]
                                        self?.addSongToPlaylist(playlistName: selectedValue!, songIndex: indexPath.row)
                            }
                    editRadiusAlert.addAction(okAction)
                    editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self?.present(editRadiusAlert, animated: true)
                }
                if cell?.isPlaying() ?? true {
                    action.backgroundColor = .black
                } else {
                    action.backgroundColor = .black
                }
                action.image = UIImage(systemName: "livephoto.play")
                return action
    }

    func addSongToPlaylist(playlistName: String, songIndex: Int) {
        self.searchSongsViewModel.addSongToPlaylist(playlistName: playlistName, songIndex: songIndex)
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
            let cell = tableView.cellForRow(at: indexPath) as? TableCell
            let img = UIImage(systemName: "livephoto.play")
            cell?.playBtn.tintColor = UIColor.yellow
            cell?.playBtn.setImage(img, for: .normal)
            cell?.tblcellplayer = self.player
            cell?.musicPlayed()
            if cell?.isPlaying() ?? false {
                self.searchSongsViewModel.addToRecentSongs(songIndex: indexPath.row)
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

    var pickerData: [String] = [String]()

}

extension ArtistMediaTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        // Number of columns of data
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        // The number of rows of data
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }

        // The data to return fopr the row and component (column) that's being passed in
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[row]
        }
}

extension ArtistMediaTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let trace = Performance.startTrace(name: "customTraceName")
        guard let searchBarText = searchBar.text else {return}
        self.searchSongsViewModel.getCollections(artistName: searchBarText)
        trace?.stop()
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
