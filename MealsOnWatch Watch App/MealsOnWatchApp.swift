//
//  MealsOnWatchApp.swift
//  MealsOnWatch Watch App
//
//  Created by Dalibor Andjelkovic on 21.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import WatchConnectivity

@main
struct MealsOnWatchApp: App {
    @Environment(\.scenePhase) private var scenePhase
    let wcSessionDelegator = WCSessionDelegator()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { newScenePhase in
                    if newScenePhase == .active {
                        WCSession.default.delegate = wcSessionDelegator
                        WCSession.default.activate()
                    }
                }
        }
    }
}
