//
//  ProfileVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/17.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary
import FirebaseAnalytics
import Crashlytics

class ProfileVC: UIViewController {

    @IBOutlet weak var noplaylistsUILabel: UILabel!
    @IBOutlet weak var emailUILabel: UILabel!
    @IBOutlet weak var genderUILabel: UILabel!
    @IBOutlet weak var usernameUILabel: UILabel!
     @IBOutlet weak var profileImage: UIImageView!
    lazy var profileViewModel: ProfileViewModelProtocol = ProfileViewModel(viewController: self, repo: ProfileRepo())
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponents()
        fetchProfileData()
    }

    func setUpUIComponents() {
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 2.0
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: nil)
    }

    @IBAction func logout(_ sender: Any) {
        let dialogMessage = UIAlertController(title: "Logging Out",
                                              message: "Are you sure you want log out?",
                                              preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                               style: .default,
                               handler: { (_) -> Void in
             print("Ok button tapped")
                                self.profileViewModel.logoutRequest()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) -> Void in
        }
        dialogMessage.addAction(okAction)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

extension ProfileVC: ProfileViewControllerProtocol {
    func fetchProfileData() {
        self.profileViewModel.getUserProfile()
    }

    func successfulRequest(profileModel: ProfileModel) {
        self.emailUILabel.text = profileModel.email
        self.genderUILabel.text = profileModel.gender.stringValue
        self.noplaylistsUILabel.text = "\(profileModel.noPlaylists)"
        self.usernameUILabel.text = profileModel.name
    }

    func successfulLogout() {
        Analytics.logEvent("user_logged_out", parameters: nil)
        let storyboard = UIStoryboard(name: "EntryBoard", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "EntryBoardLoginID") as UIViewController
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
            present(destinationVC, animated: true, completion: nil)
    }

    func failedProfileRequest(errorMessage: String) {
    }

    func failedLogoutRequest(errorMessage: String) {
    }
}
