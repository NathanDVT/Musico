//
//  SearchVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/29.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class SearchVC: UIViewController, MusicControllable, SearchViewControllerProtocol {
    var musicBarViewController: MusicBarViewController?
    var musicControllerViewModel: MusicBarViewModel?
    @IBOutlet weak var searchBar: UISearchBar!
    var pickerData: [String] = [String]()
    lazy var searchSongsViewModel: SearchSongsViewModel = SearchSongsViewModel(view: self, repo: SearchSongRepo())
    @IBOutlet weak var songsTableView: UITableView!
    var listOfSongs = [SearchSongDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.songsTableView.separatorColor = GraphicColors.secondary
                self.songsTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.songsTableView.dataSource = self
        self.songsTableView.delegate = self
        self.songsTableView.reloadData()
        self.searchBar.delegate = self
        self.searchSongsViewModel.getUserPlaylistNames()
    }

    func unsuccessfulRequest(errorMessage: String) {

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchToMusicBar" {
            guard let destVC = segue.destination as? MusicBarViewController else {
                return
            }
            self.musicBarViewController = destVC
            self.musicBarViewController?.musicControllerViewModel = self.musicControllerViewModel
        }
    }

    func successFulRecentSongsReceived(playlistNames: [String]) {
        pickerData = playlistNames
    }

    func successfulRequest() {
        self.listOfSongs = self.searchSongsViewModel.getSongs()
    }
}
// MARK: - TableView
extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfSongs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "SearchSongCell1",
                                                       for: indexPath) as? SearchSongCell else {
            return UITableViewCell()
        }
        cell.setCellContent(song: listOfSongs[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        destination?.selectedPlaylist = self.playlistModels[indexPath.row]
        let index = indexPath.row
        let song: SearchSongDetail = listOfSongs[index]
        self.musicControllerViewModel?.playFromUrlWithTitle(urlString: song.previewUrl,
                                                   title: "\(song.artistName) - \(song.titleName)")
        self.musicBarViewController?.updateBarContent()
        self.addSongToPlaylist(playlistName: "Recent", songIndex: indexPath.row)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action2 = addToPlaylistAction(at: indexPath, then: tableView)
        return UISwipeActionsConfiguration(actions: [ action2])
    }

    func addToPlaylistAction(at indexPath: IndexPath, then tableView: UITableView) -> UIContextualAction {
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
                action.backgroundColor = GraphicColors.secondary
                action.image = UIImage(systemName: "plus.circle.fill")
                return action
    }

    func addSongToPlaylist(playlistName: String, songIndex: Int) {
        self.searchSongsViewModel.addSongToPlaylist(playlistName: playlistName, songIndex: songIndex)
    }
}
// MARK: - PickerView
extension SearchVC: UIPickerViewDelegate, UIPickerViewDataSource {
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

extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        self.searchSongsViewModel.getCollections(artistName: searchBarText)
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        switch selectedScope {
//        case 0:
//            self.searchTitleIndex = selectedScope
//        case 1:
//            self.searchTitleIndex = selectedScope
//        default:
//            print("Error")
//        }
//        self.tableView.reloadData()
    }
}
