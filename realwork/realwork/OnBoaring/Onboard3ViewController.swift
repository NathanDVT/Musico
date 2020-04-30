//
//  Onboard3ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/17.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class Onboard3ViewController: UIViewController {

    @IBOutlet var onboardView3: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGradient()
    }

    func addGradient() {
        let layer = CAGradientLayer()
        layer.frame = onboardView3.bounds
        layer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        layer.locations = [0.55, 0.63, 0.91, 0.92]
        onboardView3.backgroundColor = .none
        onboardView3.layer.insertSublayer(layer, at: 0)
    }

    @IBAction func btnNavToSignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EntryBoard", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "EntryBoardLoginID")
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
            present(destinationVC, animated: true, completion: nil)
    }
}
