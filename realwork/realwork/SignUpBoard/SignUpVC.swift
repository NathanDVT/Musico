//
//  SignUpVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/19.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
//import Firebase
import NLibrary

class SignUpVC: UIViewController {

    @IBOutlet weak var edtEmail: UITextField!
    @IBOutlet weak var edtPassword: UITextField!
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    lazy var userVM: UserVM = {
        return UserVM(viewController: self, userRepo: UserRepo())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        loaderIndicator.transform = transfrom
        loaderIndicator.hidesWhenStopped = true
        let repo: UserRepoProtocol = UserRepo()
        userVM = UserVM(viewController: self, userRepo: repo)
    }

    @IBAction func btnSignUp(_ sender: Any) {
        loaderIndicator.startAnimating()
        let email: String = edtEmail!.text!
        let password: String = edtPassword!.text!
        self.userVM.signUp(email: email, password: password)
    }

    func showMessagePrompt(title: String, message: String) {
        loaderIndicator.stopAnimating()
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}

extension SignUpVC: SignUpVCprotocol {
    func successfulSignIn() {
        loaderIndicator.stopAnimating()
        let storyboard = UIStoryboard(name: "DashboardTab", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "DashboardTabID") as? UITabBarController
        if let destinationVC = destinationVC {
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .flipHorizontal
            present(destinationVC, animated: true, completion: nil)
        }
    }
    func unsuccessfulSignIn(message: String) {
        loaderIndicator.stopAnimating()
        showMessagePrompt(title: "Opps!", message: message)
    }
}
