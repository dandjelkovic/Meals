//
//  EditMeal.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 20.01.20.
//  Copyright © 2020 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import CoreData
import Combine

struct EditMeal: View {
    @Environment(\.presentationMode)
    var presentationMode
    @Environment(\.managedObjectContext)
    var managedObjectContext

    @State private var title = ""
    @State private var type = 0
    @State private var timestamp = Date()
    @State private var weight = 0

    var meal: Meal
    private let mealTypes = MealType.allCases
    private let mealWeights = Weight.allCases

    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()
                .border(Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0), width: 1)
            Picker(selection: $type, label: Text("Type")) {
                ForEach(Array(mealTypes.enumerated()), id: \.1) { offset, types in
                    Text(types.stringValue).tag(offset)
                }
            }
            DatePicker(
                selection: $timestamp,
                in: ...Date(),
                displayedComponents: .date
            ) {
                Text("Datetime")
            }
            Picker(selection: $weight, label: Text("Weight")) {
                ForEach(Array(mealWeights.enumerated()), id: \.1) { offset, weight in
                    Text(weight.stringValue).tag(offset)
                }
            }
            HStack {
                Button(
                    action: {
                        self.meal.title = self.title
                        self.meal.timestamp = self.timestamp
                        self.meal.typeString = self.mealTypes[self.type].stringValue
                        self.meal.weightString = self.mealWeights[self.weight].stringValue
                        do {
                            try self.meal.managedObjectContext?.save()
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                ) {
                    Text("Save")
                }
                .buttonStyle(BorderlessButtonStyle())
                Button(
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                ) {
                    Text("Cancel").foregroundColor(.red)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .onAppear {
            self.title = self.meal.title ?? ""
            self.type = self.mealTypes.firstIndex(of: self.meal.type) ?? 0
            self.weight = self.mealWeights.firstIndex(of: self.meal.weight) ?? 0
        }
    }
}

struct EditMeal_Previews: PreviewProvider {
    static var previews: some View {
        let meal = Meal()
        meal.type = .meat
        meal.timestamp = Date()
        meal.weight = .medium
        return EditMeal(meal: meal)
    }
}
