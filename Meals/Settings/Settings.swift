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

    @Environment(\.managedObjectContext)
    var managedObjectContext

    var caloriesCountsString: String {
        Weight.allCases.map { weight in
            (caloriesCounts.first?.stringValue(weight: weight) ?? "")
        }.joined(separator: ", ")
    }

    @State var actionSheetPresented = false
    @State var exportSheetPresented = false

    @State var caloriesCountLight = ""
    @State var caloriesCountMedium = ""
    @State var caloriesCountHeavy = ""

    var exportURL: URL? = FileExporter().exportDatabase()
    let exporter = FileExporter()

    var body: some View {
        if !caloriesCounts.isEmpty {
            Form {
                Section(header: Text("Calories count")) {
                    HStack {
                        Text(Weight.light.stringValue + ":")
                        Spacer()
                        TextField(
                            caloriesCounts[0].light.stringValue,
                            text: $caloriesCountLight,
                            onCommit: {
                                self.updateCaloriesCount()
                            }
                        )
                            .keyboardType(.default)
                            .frame(width: 60)
                            .multilineTextAlignment(.trailing)
                        Text("kCal")
                    }
                    HStack {
                        Text(Weight.medium.stringValue + ":")
                        Spacer()
                        TextField(
                            caloriesCounts[0].medium.stringValue,
                            text: $caloriesCountMedium,
                            onCommit: {
                                self.updateCaloriesCount()
                            }
                        )
                            .keyboardType(.default)
                            .frame(width: 60)
                            .multilineTextAlignment(.trailing)
                        Text("kCal")
                    }
                    HStack {
                        Text(Weight.heavy.stringValue + ":")
                        Spacer()
                        TextField(
                            caloriesCounts[0].heavy.stringValue,
                            text: $caloriesCountHeavy,
                            onCommit: {
                                self.updateCaloriesCount()
                            }
                        )
                            .keyboardType(.default)
                            .frame(width: 60)
                            .multilineTextAlignment(.trailing)
                        Text("kCal")
                    }

                }
                Section(header: Text("Backup your data")) {
                    // swiftlint:disable trailing_closure multiple_closures_with_trailing_closure
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
            .onAppear {
                self.caloriesCountLight = self.caloriesCounts.first?.light.stringValue ?? ""
                self.caloriesCountMedium = self.caloriesCounts.first?.medium.stringValue ?? ""
                self.caloriesCountHeavy = self.caloriesCounts.first?.heavy.stringValue ?? ""
            }
            //        .modifier(DismissingKeyboard())
        } else {
            Text("No meals yet").bold()
        }
    }

    private func updateCaloriesCount() {
        guard
            let count = caloriesCounts.first
        else { return }

        caloriesCountLight = String(caloriesCountLight.extractInt())
        caloriesCountMedium = String(caloriesCountMedium.extractInt())
        caloriesCountHeavy = String(caloriesCountHeavy.extractInt())

        count.light = String(caloriesCountLight) != ""
            ? caloriesCountLight.extractInt16()
            : CaloriesCount.defaultValues(weight: .light)
        count.medium = String(caloriesCountMedium) != ""
            ? caloriesCountMedium.extractInt16()
            : CaloriesCount.defaultValues(weight: .medium)
        count.heavy = String(caloriesCountHeavy) != ""
            ? caloriesCountHeavy.extractInt16()
            : CaloriesCount.defaultValues(weight: .heavy)

        if self.managedObjectContext.hasChanges {
            do {
                try self.managedObjectContext.save()

            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
