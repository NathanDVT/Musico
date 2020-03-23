//
//  GlobalConstants.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/18.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit

struct GraphicColors {
    static let primary = UIColor.systemYellow
}

struct GlobalFont {
    static let primary = UIFont(name: "Gill Sans", size: 32)
}

//extension UIColor {
//    public convenience init?(hex: String) {
//        let rrr, ggg, bbb, aaa: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    rrr = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    ggg = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    bbb = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    aaa = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: rrr, green: ggg, blue: bbb, alpha: aaa)
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}

