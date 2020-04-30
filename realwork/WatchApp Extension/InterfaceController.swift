//
//  InterfaceController.swift
//  WatchApp Extension
//
//  Created by Nathan Ngobale on 2020/04/29.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity //**1

class InterfaceController: WKInterfaceController {

    let session = WCSession.default//**3
    let colorThemes: [UIColor] = [.yellow, .blue,
                                .magenta, .red,
                                .purple, .green]

    @IBAction func tapSendToiPhone() {
        let data: [String: Any] = ["watch": "data from watch" as Any] //Create your dictionary as per uses
        session.sendMessage(data, replyHandler: nil, errorHandler: nil) //**6.1
    }
    @IBOutlet weak var buttonController: WKInterfaceButton!
    @IBOutlet weak var playingName: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
        session.delegate = self//**4
        session.activate()//**5
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        if let value = message["iPhone"] as? String {//**7.1
          self.playingName.setText("Playing: \(value)")
        }
        if let color = message["color"] as? Int {
            self.buttonController.setBackgroundColor(self.colorThemes[color])
            self.playingName.setTextColor(self.colorThemes[color])
        }
    }
}
