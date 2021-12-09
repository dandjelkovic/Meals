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

    var days = [Day]()

    var body: some View {
        VStack {
            List {
                ForEach(days, id: \.self) { day in
                    Section(header: Text(day.dateString)) {
                        ForEach(day.meals, id: \.id) { meal in
                            MealCell(meal: meal)
                        }
                        .onDelete { indexSet in
                            guard let indexFirst = indexSet.first else { return }
                            self.deleteMealEntry(day.meals[indexFirst])
                        }
                    }
                }
            }
            Divider()
            Text("What did you eat?").bold()
            AddMealView(context: managedObjectContext)
        }
    }

    private func deleteMealEntry(_ meal: Meal) {
        managedObjectContext.delete(meal)
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
