//
//  ContentView.swift
//  MealsOnWatch Watch App
//
//  Created by Dalibor Andjelkovic on 21.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var isWCSessionActivated = false
    private let wcSessionDelegator = WCSessionDelegator()

    var body: some View {
        VStack {
            Group {
                if isWCSessionActivated {
                    AddMealView()
                } else {
                    Spacer()
                    Text(verbatim: "Watch connection is not active. Restart Watch App.")
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
            .onAppear {
                isWCSessionActivated = WCSession.default.activationState == .activated
            }
        }
        .onChange(of: scenePhase) { _ in
            isWCSessionActivated = WCSession.default.activationState == .activated
            if WCSession.default.activationState == .notActivated {
                WCSession.default.delegate = wcSessionDelegator
                WCSession.default.activate()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
