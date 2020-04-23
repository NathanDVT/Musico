//
//  DashboardTabBarControllerNew.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class DashboardTabBarControllerNew: UITabBarController {
    var musicControllerViewModel: MusicBarViewModel = MusicBarViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for iterator in 0..<self.viewControllers!.count {
            let viewController = self.viewControllers![iterator]
            if var testController = viewController.children.first as? MusicControllable {
                testController.musicControllerViewModel = musicControllerViewModel
            }
        }
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tabIndex: Int = (tabBar.items?.firstIndex(of: item))!
        let viewController = self.viewControllers![tabIndex]
        if let testController = viewController.children.first as? MusicControllable {
            testController.musicBarViewController?.updateBarContent()
        }
    }
}
