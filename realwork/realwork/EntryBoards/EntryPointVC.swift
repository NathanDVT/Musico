//
//  EntryPointVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/19.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import Firebase

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
    //    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      // [START auth_listener]
//      handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//        // [START_EXCLUDE]
//        //self.setTitleDisplay(user)
//        //self.tableView.reloadData()
//        // [END_EXCLUDE]
//      }
//      // [END auth_listener]
//      // Authenticate Game Center Local Player
//      // Uncomment to sign in with Game Center
//      // self.authenticateGameCenterLocalPlayer()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//      super.viewWillDisappear(animated)
//      // [START remove_auth_listener]
//      Auth.auth().removeStateDidChangeListener(handle!)
//      // [END remove_auth_listener]
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
