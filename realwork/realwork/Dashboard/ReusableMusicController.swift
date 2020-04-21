//
//  ReusableMusicController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/21.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class ReusableMusicController: UIView {
    let nibName = "ReusableMusicController"

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    @IBOutlet weak var curvedView: UIView!
    @IBOutlet var nibView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(nibView)
        nibView.frame = self.bounds
        nibView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        curvedView.clipsToBounds = true
        curvedView.layer.cornerRadius = 40
        curvedView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
