//
//  ContentView.swift
//  MealsOnWatch Watch App
//
//  Created by Dalibor Andjelkovic on 21.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    let wcSessionDelegator = WCSessionDelegator()

    var body: some View {
        VStack {
            AddMealView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
