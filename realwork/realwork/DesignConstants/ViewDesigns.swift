//
//  ViewDesigns.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/16.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

class ViewPrimaryBackgroundGradient: UIView {
    let layer1 = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        layer1.frame = self.bounds
        let hexGenCol1: UIColor = HexToUIColor(hexcode: "#919191ff").color
        let hexGenCol2: UIColor = HexToUIColor(hexcode: "#eeeeeeff").color
        layer1.colors = [hexGenCol1.cgColor,
                        hexGenCol2.cgColor]
        layer1.locations = [0.0, 1.0]
        self.backgroundColor = .none
        self.layer.insertSublayer(layer1, at: 0)
    }
    override func layoutSubviews() {
        layer1.frame = self.bounds
    }
}

class ViewInversePrimaryGradient: UIView {
    let layer1 = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        layer1.frame = self.bounds
        let hexGenCol1: UIColor = HexToUIColor(hexcode: "#939393ff").color
        let hexGenCol2: UIColor = HexToUIColor(hexcode: "#eeeeeeff").color
        layer1.colors = [hexGenCol2.cgColor,
                        hexGenCol1.cgColor]
        layer1.locations = [0.0, 1.0]
        self.backgroundColor = .none
        self.layer.insertSublayer(layer1, at: 0)
    }
    override func layoutSubviews() {
        layer1.frame = self.bounds
    }
}

class TrendingGradientBackgroudn: UIView {
    let layer1 = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        layer1.frame = self.bounds
        let hexGenCol1: UIColor = HexToUIColor(hexcode: "#00000000").color
        let hexGenCol2: UIColor = GraphicColors.secondary
        layer1.colors = [hexGenCol1.cgColor,
                        hexGenCol2.cgColor]
        layer1.locations = [0.0, 0.4]
        self.backgroundColor = .none
        self.layer.insertSublayer(layer1, at: 0)
    }

    override func layoutSubviews() {
        layer1.frame = self.bounds
    }
}

class ViewShadow: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

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

class InversedPrimaryShadowView: ViewInversePrimaryGradient {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.9
    }
}

class PrimaryGradientShadowView: UIView {
    let layer1 = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        layer1.frame = self.bounds
        let hexGenCol1: UIColor = HexToUIColor(hexcode: "#222222ff").color
        let hexGenCol2: UIColor = GraphicColors.primary
        layer1.colors = [hexGenCol1.cgColor,
                        hexGenCol2.cgColor]
        layer1.locations = [0.0, 1.0]
        self.backgroundColor = .none
        self.layer.insertSublayer(layer1, at: 0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.9
    }
    override func layoutSubviews() {
        layer1.frame = self.bounds
    }
}

class Radius10View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

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

class ViewPrimarySolid: UIView {
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
