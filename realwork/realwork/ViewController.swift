//
//  ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/04.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import AVKit
import NLibrary
import FirebaseAnalytics

class ViewController: UIViewController {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnOnboard(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "OnBoardingID") as? UIPageViewController
        if let destinationVC = destinationVC {
            present(destinationVC, animated: true, completion: nil)
        }
    }

    @IBAction func btnToDashboard(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DashboardTab", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "DashboardTabID") as? UITabBarController
        if let destinationVC = destinationVC {
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
            present(destinationVC, animated: true, completion: nil)
        }
    }
}

struct SwiftFourMusicResults: Decodable {
    let resultCount: Int
}
