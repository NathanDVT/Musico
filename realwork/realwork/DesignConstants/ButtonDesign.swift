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
