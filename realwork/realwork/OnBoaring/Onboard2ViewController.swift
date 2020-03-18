//
//  Onboard2ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/17.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class Onboard2ViewController: UIViewController {

    @IBOutlet var onboardView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addGradient()
    }

    func addGradient() {
        let layer = CAGradientLayer()
        layer.frame = onboardView2.bounds
        layer.colors = [UIColor.black.cgColor, UIColor.systemYellow.cgColor,
                        UIColor.systemYellow.cgColor, UIColor.black.cgColor,
                        UIColor.black.cgColor, UIColor.black.cgColor]
        layer.locations = [0.0, 0.1, 0.6, 0.7, 0.8, 0.90]
        onboardView2.backgroundColor = .none
        onboardView2.layer.insertSublayer(layer, at: 0)
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
