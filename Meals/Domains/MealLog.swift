//
//  MealLog.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct MealLog: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Meal.timestamp, ascending: false)])
    var meals: FetchedResults<Meal>
    
    var body: some View {
        VStack {
            Text("Meals").font(.largeTitle)
            .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .center)
            Spacer()
            List {
                ForEach(meals, id: \.self) { meal in
                    MealCell(meal: meal)
                }
                .onDelete { indexSet in
                    self.deleteMealEntry(at: indexSet)
                }
            }
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                AddMealButton(weight: .light, context: self.managedObjectContext)
                Divider()
                AddMealButton(weight: .medium, context: self.managedObjectContext)
                Divider()
                AddMealButton(weight: .heavy, context: self.managedObjectContext)
            }
            .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .center)
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
