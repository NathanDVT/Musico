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

class ButtonPrimaryTint: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.tintColor = GraphicColors.primary
    }
}

class ButtonSecondaryDesign: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.backgroundColor = GraphicColors.secondary
    }
}

class ButtonSecondaryTint: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.tintColor = GraphicColors.secondary
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
class ButtonPrimaryTintShadonw: ButtonPrimaryTint {
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

class ButtonRadius10: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner,
                                    .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

func compareColors (co1: UIColor, co2: UIColor) -> Bool {
    var red: CGFloat = 0
    var green: CGFloat  = 0
    var blue: CGFloat = 0
    var alpha: CGFloat  = 0
    co1.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

    var red2: CGFloat = 0
    var green2: CGFloat  = 0
    var blue2: CGFloat = 0
    var alpha2: CGFloat  = 0
    co2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)

    return (Int(red*255) == Int(red*255) && Int(green*255) == Int(green2*255) && Int(blue*255) == Int(blue*255) )
}
