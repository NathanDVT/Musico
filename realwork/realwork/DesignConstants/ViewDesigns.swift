//
//  ViewDesigns.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/16.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class ViewPrimaryBackground: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
//        let objcObj: HexToUIColor = HexToUIColor(hexcode: "#939393ff")
        let hexGenCol1: UIColor = HexToUIColor(hexcode: "#eeeeeeff").color
        let hexGenCol2: UIColor = HexToUIColor(hexcode: "#939393ff").color
        layer.colors = [hexGenCol1.cgColor,
                        hexGenCol2.cgColor]
        layer.locations = [0.0, 1.0]
        self.backgroundColor = .none
        self.layer.insertSublayer(layer, at: 0)
    }
}

//        super.viewDidLoad()
//        let layer = CAGradientLayer()
//        layer.frame = homeView.bounds
//        let objcObj: HexToUIColor = HexToUIColor()
//        let hexGenCol: UIColor = objcObj.color
//        layer.colors = [UIColor.systemYellow.cgColor, UIColor.black.cgColor,
//                        hexGenCol.cgColor]
//        layer.locations = [0.0, 0.095, 0.97]
//        homeView.backgroundColor = .none
//        homeView.layer.insertSublayer(layer, at: 0)
