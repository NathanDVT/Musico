//
//  EntryPointVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/19.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
//import Firebase
import NLibrary

class EntryPointVC: UIViewController/*,LoginViewControllerProtocol*/ {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Old")
    }

    @IBAction func btnLogin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DashboardTab", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "DashboardTabID") as? UITabBarController
        if let destinationVC = destinationVC {
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
            present(destinationVC, animated: true, completion: nil)
        }
    }

//    func signin( _ email: String!, _ password: String!) {
//    }
//
//    func successfulSignIn() {
//    }
//
//    func unsuccessfulSignIn() {
//    }
}
