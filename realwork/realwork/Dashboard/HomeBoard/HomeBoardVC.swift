//
//  HomeBoardVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
//import UserC
import NLibrary
class HomeBoardVC: UIViewController, DashboardViewControllerProtocol, UITabBarControllerDelegate {
    func successFulSongRequests(songs: [RecentSong]) {
        for iterator in 0..<arrayRecentButtons.count {
            arrayRecentButtons[iterator]
                .setTitle("\(songs[iterator].artistName)- \(songs[iterator].titleName)", for: .normal)
        }
    }

    @IBOutlet weak var homeUIButton: UITabBarItem!
    func successFulNameRequest(name: String) {
        userNameLabel.text = name
    }

    @IBAction func playPauseUIButton(_ sender: Any) {
        viewModel.pauseOrPlayCurrentSong()
    }

    func setCurrentControlIcon(img: UIImage) {
        currentControlUIButton.setBackgroundImage(img, for: .normal)
    }

    func setSongTitle(title: String) {
        currentSongTitleUILabel.text = title
    }
    
    @IBOutlet weak var currentControlUIButton: UIButton!
    @IBOutlet weak var currentSongTitleUILabel: UILabel!
    @IBOutlet var arrayRecentButtons: [UIButton]!
    @IBOutlet var buttonCollection: [UIButton]!
    //    @IBOutlet var recentSongButtons: [UIButton] = []
    @IBOutlet weak var userNameLabel: UILabel!
    lazy var viewModel: DashboardViewModelProtocol = DashboardViewModel(viewController: self, repo: DashboardRepo())
    @IBOutlet var homeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = homeView.bounds
        let objcObj: HexToUIColor = HexToUIColor()
        let hexGenCol: UIColor = objcObj.color
        layer.colors = [UIColor.systemYellow.cgColor, UIColor.black.cgColor,
                        hexGenCol.cgColor]
        layer.locations = [0.0, 0.095, 0.97]
        homeView.backgroundColor = .none
        homeView.layer.insertSublayer(layer, at: 0)

        loadDashBoardContent()
        // Do any additional setup after loading the view.
    }

    public func loadDashBoardContent() {
        viewModel.loadContent()
    }

    @IBAction func selectedRecentSong(_ sender: UIButton) {
        viewModel.playRecentSongAt(index: arrayRecentButtons.firstIndex(of: sender)!)
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
