//
//  MealLog.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct MealLog: View {
    @Environment(\.managedObjectContext)
    var managedObjectContext
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Meal.timestamp, ascending: false)])
    var meals: FetchedResults<Meal>
    var days = [Day]()
    
    var body: some View {
        VStack {
            Text("Meals").font(.largeTitle)
            .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .center)
            Spacer()
            List {
                ForEach(days, id: \.self) { day in
                    Section(header: Text(day.dateString)) {
                        ForEach(day.meals, id: \.self) { meal in
                            MealCell(meal: meal)
                        }
                        .onDelete { indexSet in
                            self.deleteMealEntry(at: indexSet)
                        }
                    }
                }
            }//.listStyle(GroupedListStyle())
            Divider()
            HStack {
                VStack(alignment: .center, spacing: 5) {
                    AddMealButton(weight: .light, type: .vegan, context: self.managedObjectContext)
                    Divider()
                    AddMealButton(weight: .medium, type: .vegan, context: self.managedObjectContext)
                    Divider()
                    AddMealButton(weight: .heavy, type: .vegan, context: self.managedObjectContext)
                }.frame(width: 120, height: nil, alignment: .center)
                VStack(alignment: .center, spacing: 5) {
                    AddMealButton(weight: .light, type: .vegetarian, context: self.managedObjectContext)
                    Divider()
                    AddMealButton(weight: .medium, type: .vegetarian, context: self.managedObjectContext)
                    Divider()
                    AddMealButton(weight: .heavy, type: .vegetarian, context: self.managedObjectContext)
                }.frame(width: 120, height: nil, alignment: .center)
                VStack(alignment: .center, spacing: 5) {
                    AddMealButton(weight: .light, type: .meat, context: self.managedObjectContext)
                    Divider()
                    AddMealButton(weight: .medium, type: .meat, context: self.managedObjectContext)
                    Divider()
                    AddMealButton(weight: .heavy, type: .meat, context: self.managedObjectContext)
                }.frame(width: 120, height: nil, alignment: .center)

            }
        }
    }

    private func deleteMealEntry(at offsets: IndexSet) {
        offsets.forEach { index in
            let meal = meals[index]
            managedObjectContext.delete(meal)
        }
        do {
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct MealLog_Previews: PreviewProvider {
    static var previews: some View {
        MealLog()
    }
}
