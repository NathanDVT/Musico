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
import FirebaseAnalytics

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loaderIndicatorView: UIActivityIndicatorView!
    lazy var userVM: SignUpViewModel = SignUpViewModel(viewController: self, signUpRepo: SignUpRepo())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        loaderIndicatorView.transform = transfrom
        loaderIndicatorView.hidesWhenStopped = true
    }

    @IBAction func btnSignUp(_ sender: Any) {
        loaderIndicatorView.startAnimating()
        let email: String = emailTextField!.text!
        let password: String = passwordTextField!.text!
        Analytics.logEvent("register_user", parameters: nil)
        self.userVM.signUp(email: email, password: password)
    }

    func showMessagePrompt(title: String, message: String) {
        loaderIndicatorView.stopAnimating()
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        Analytics.logEvent("failed_to_register", parameters: nil)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension SignUpVC: SignUpViewControllerProtocol {
    func successfulSignIn() {
        loaderIndicatorView.stopAnimating()
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
        loaderIndicatorView.stopAnimating()
        showMessagePrompt(title: "Opps!", message: message)
    }
}
