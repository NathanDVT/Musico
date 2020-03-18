//
//  LabelDesign.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

class LabelPrimaryDesign: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setUp()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
       setUp()
    }
    
    private func setUp() {
        self.font = GlobalFont.primary
    }
}
