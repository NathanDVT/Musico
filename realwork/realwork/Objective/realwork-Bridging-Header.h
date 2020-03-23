//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import "UserClass.h"
#import "UserProtocol.h"
//#import "UserClass.m"

//if hex.hasPrefix("#") {
//    let start = hex.index(hex.startIndex, offsetBy: 1)
//    let hexColor = String(hex[start...])
//
//    if hexColor.count == 8 {
//        let scanner = Scanner(string: hexColor)
//        var hexNumber: UInt64 = 0
//
//        if scanner.scanHexInt64(&hexNumber) {
//            rrr = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//            ggg = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//            bbb = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//            aaa = CGFloat(hexNumber & 0x000000ff) / 255
//
//            self.init(red: rrr, green: ggg, blue: bbb, alpha: aaa)
//            return
//        }
//    }
//}
