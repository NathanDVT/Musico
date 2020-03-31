//
//  DashboardTabBarController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/19.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [newVC(viewController: "Onboard1")]
        // Do any additional setup after loading the view.
    }

    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
}
