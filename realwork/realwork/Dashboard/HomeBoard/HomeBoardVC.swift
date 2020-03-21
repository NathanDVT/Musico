//
//  HomeBoardVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class HomeBoardVC: UIViewController {

    @IBOutlet var homeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = homeView.bounds
        layer.colors = [UIColor.systemYellow.cgColor, UIColor.black.cgColor,
                         UIColor(hex: "#6C5A20ff")?.cgColor]
        layer.locations = [0.0, 0.095, 0.97]
        homeView.backgroundColor = .none
        homeView.layer.insertSublayer(layer, at: 0)

        // Do any additional setup after loading the view.
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
