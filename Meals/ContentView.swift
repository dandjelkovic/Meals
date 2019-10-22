//
//  ContentView.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MealLog()
            .tabItem {
                Image(systemName: "book")
                Text("Meals")
            }
            Statistics()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Statistics")
            }
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
