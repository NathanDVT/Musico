//
//  GlobalConstants.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import NLibrary

public struct GraphicColors {
    static let primaryCodes: [String] = ["#e8d902ff", "#00E6FEff",
                                         "#F53899ff", "#A80B00ff",
                                         "#5900FFff", "#00FF0Cff"]
    static let secondaryCodes: [String] = ["#939393ff", "#267780ff",
                                           "#C22D7Aff", "#750800ff",
                                           "#452680ff", "#26802Bff"]
    static var primary = HexToUIColor(hexcode: "#e8d902ff").color
    static var secondary = HexToUIColor(hexcode: "#939393ff").color
}

struct GlobalFont {
    static let primary = UIFont(name: "Gill Sans", size: 32)
}
