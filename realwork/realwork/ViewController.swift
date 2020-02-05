//
//  ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/04.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn_Google: UIButton!
    
    @IBOutlet weak var btn_SignUp: UIButton!
    
    @IBOutlet weak var img_Background: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_Google.layer.cornerRadius = 30.0
        btn_Google.layer.masksToBounds = true
        btn_SignUp.layer.cornerRadius = 30.0
        btn_SignUp.layer.masksToBounds = true
        
        img_Background.image = UIImage(named: "first")
        // Do any additional setup after loading the view.
    }


}

