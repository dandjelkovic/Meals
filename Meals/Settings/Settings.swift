//
//  Settings.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 05.11.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @FetchRequest(
        entity: CaloriesCount.entity(),
        sortDescriptors: []
    )

    var caloriesCounts: FetchedResults<CaloriesCount>

    @State var actionSheetPresented = false
    @State var exportSheetPresented = false
    @State var caloriesCountLight = ""
    @State var caloriesCountMedium = ""
    @State var caloriesCountHeavy = ""

    var exportURL: URL? = FileExporter().exportDatabase()
    let exporter = FileExporter()

    var body: some View {
        Form {
            Section(header: Text("Calories count")) {
                HStack {
                    Text(Weight.light.stringValue + ":")
                    TextField(caloriesCounts[0].light.stringValue, text: $caloriesCountLight)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("kCal")
                }
                HStack {
                    Text(Weight.medium.stringValue + ":")
                    TextField(caloriesCounts[0].medium.stringValue, text: $caloriesCountMedium)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("kCal")
                }
                HStack {
                    Text(Weight.heavy.stringValue + ":")
                    TextField(caloriesCounts[0].heavy.stringValue, text: $caloriesCountHeavy)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("kCal")
                }

            }
            Section(header: Text("Backup your data")) {
                //swiftlint:disable trailing_closure multiple_closures_with_trailing_closure
                Button(
                    action: {
                        self.actionSheetPresented = true
                    }
                ) {
                    Text("Backup as CSV file").bold().padding(5).border(Color.secondary)
                }
                .sheet(
                    isPresented: $actionSheetPresented,
                    content: {
                        ActivityViewController(items: [self.exportURL as Any])
                    }
                )
            }
            Section(header: Text("Icons by")) {
                Button("https://icons8.de/") {
                    if let url = URL(string: "https://icons8.de/") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        }

    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
