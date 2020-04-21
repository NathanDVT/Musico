//
//  DashboardTabBarControllerNew.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class MusicPlayer {

}

class DashboardTabBarControllerNew: UITabBarController {
    var musicControllerViewModel: MusicControllerViewModel = MusicControllerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for iterator in 0..<self.viewControllers!.count {
            if let navController = self.viewControllers![iterator] as? UINavigationController {
                if var testController = navController.children.first as? MusicControllable {
                    testController.musicControllerViewModel = musicControllerViewModel
                }
            }
        }
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tabIndex: Int = (tabBar.items?.firstIndex(of: item))!
        if let navController = self.viewControllers![tabIndex] as? UINavigationController {
            if let testController = navController.children.first as? MusicControllable {
                testController.musicBarViewController?.updateBarContent()
            }
        }
    }
}
