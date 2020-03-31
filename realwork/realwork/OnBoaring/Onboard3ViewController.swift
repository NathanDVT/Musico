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
        layer.colors = [UIColor.systemYellow.cgColor, UIColor.black.cgColor,
                        UIColor.black.cgColor, UIColor.systemYellow.cgColor,
                        UIColor.systemYellow.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        layer.locations = [0.0, 0.1, 0.6, 0.67, 0.75, 0.8, 0.90]
        onboardView3.backgroundColor = .none
        onboardView3.layer.insertSublayer(layer, at: 0)
    }

    @IBAction func btnNavToSignUp(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "LoginBoard", bundle: nil)
//        let destinationVC = storyboard.instantiateViewController(withIdentifier: "LoginBoardID") as? ViewController
//        if let destinationVC = destinationVC {
//            destinationVC.modalTransitionStyle = .crossDissolve
//            present(destinationVC, animated: true, completion: nil)
//        }

        let storyboard = UIStoryboard(name: "EntryBoard", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "EntryBoardLoginID") as? UIViewController
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
