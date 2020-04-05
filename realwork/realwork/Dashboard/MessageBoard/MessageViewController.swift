//
//  MessageViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/05.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import Crashlytics

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func crashAction(_ sender: Any) {
        Crashlytics.sharedInstance().crash()
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
