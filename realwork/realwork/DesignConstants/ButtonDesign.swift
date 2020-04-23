//
//  ButtonDesign.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class ButtonPrimaryDesign: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.backgroundColor = GraphicColors.primary
    }
}

class ButtonPrimaryShadow: ButtonPrimaryDesign {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
    }
}

class ButtonShadow: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
    }
}

class ButtonPrimaryShadowCurved: ButtonPrimaryShadow {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.layer.cornerRadius = 25
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner,
                                    .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
