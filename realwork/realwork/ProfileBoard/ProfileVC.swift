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
import CoreData

class ProfileVC: UIViewController {

    @IBOutlet var colorPickerButtons: [UIButton]!
    @IBOutlet weak var noplaylistsUILabel: UILabel!
    @IBOutlet weak var emailUILabel: UILabel!
    @IBOutlet weak var genderUILabel: UILabel!
    @IBOutlet weak var usernameUILabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
//    var context: NSManagedObjectContext?
//    weak var appDelegate: AppDelegate?
    lazy var profileViewModel: ProfileViewModelProtocol = ProfileViewModel(viewController: self, repo: ProfileRepo())
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponents()
        fetchProfileData()
    }

    @IBAction func selectedColor(_ sender: UIButton) {
        for (button) in (colorPickerButtons) {
                button.setImage(nil, for: .normal)
        }
        sender.setImage(UIImage(systemName: "hexagon.fill"), for: .normal)
        guard let index: Int = colorPickerButtons.firstIndex(of: sender),
            let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserPreferences")
        request.returnsObjectsAsFaults = false
        do {
            guard let result = try context.fetch(request) as? [NSManagedObject] else {
                return
            }
            for data in result {
                data.setValue(GraphicColors.primaryCodes[index], forKey: "color1")
                data.setValue(GraphicColors.secondaryCodes[index], forKey: "color2")
            }
            appDelegate.saveContext()
        } catch {
            fatalError("Error could not print out value")
        }
    }

    func setUpUIComponents() {
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 2.0
        profileImage.backgroundColor = GraphicColors.secondary
        for (button, colorCode) in zip(colorPickerButtons, GraphicColors.primaryCodes) {
            button.backgroundColor = HexToUIColor(hexcode: colorCode).color
            if compareColors(co1: button.backgroundColor!, co2: GraphicColors.primary) {
                button.setImage(UIImage(systemName: "hexagon.fill"), for: .normal)
            }
        }
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
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "OnBoardingID") as? UIPageViewController
        if let destinationVC = destinationVC {
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
            present(destinationVC, animated: true, completion: nil)
        }
    }

    func failedProfileRequest(errorMessage: String) {
    }

    func failedLogoutRequest(errorMessage: String) {
    }
}
