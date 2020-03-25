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

class EntryPointVC: UIViewController {
//    var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
