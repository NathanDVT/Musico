//
//  ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/04.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import AVKit

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
}

struct SwiftFourMusicResults: Decodable {
    let resultCount: Int
}
