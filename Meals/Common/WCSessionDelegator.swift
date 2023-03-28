//
//  WCSessionDelegator.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import Foundation
import WatchConnectivity

class WCSessionDelegator: NSObject, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error {
            print(#function, error.localizedDescription)
        }
    }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any], replyHandler: @escaping ([String: Any]) -> Void) {
        sendNotification(message: message)
        if !session.isReachable {
            debugPrint(#function, "Counterpart not reachable")
        }
        #if os(iOS)
        if !session.isWatchAppInstalled {
            debugPrint(#function, "watch app not installed")
        }
        #endif
        replyHandler(message)
        debugPrint(#function, "replyHandler called", message)
    }

    // WCSessionDelegate methods for iOS only.
    #if os(iOS)
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        // Activate the new session after having switched to a new watch.
        session.activate()
    }

//    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
//        sendNotification(message: message)
//    }
    #endif

    private func sendNotification(message: [String: Any]) {
        let notificationName = NotificationType.receiveNewMeal.notification
        DispatchQueue.main.async {
            NotificationCenter.default.post(
                Notification(
                    name: notificationName,
                    object: nil,
                    userInfo: message
                )
            )
        }
    }

}
