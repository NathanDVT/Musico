//
//  ImageConstants.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/04/23.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

//@IBDesignable
class RoundedWhiteBorderImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        self.clipsToBounds = true
    }
}
