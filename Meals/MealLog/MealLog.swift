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
            VStack {
                HStack {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            Text("\(Type.vegan.stringValue.capitalized)?")
                                .padding(2)
                                .frame(width: geometry.size.width / 2 - 90,alignment: .leading)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            AddMealButton(weight: .light, type: .vegan, context: self.managedObjectContext)
                            AddMealButton(weight: .medium, type: .vegan, context: self.managedObjectContext)
                            AddMealButton(weight: .heavy, type: .vegan, context: self.managedObjectContext)
                            Spacer()
                        }.frame(alignment: .center)
                    }
                }.frame( height: 64, alignment: .center)
                HStack {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            Text("\(Type.vegetarian.stringValue.capitalized)?")
                                .padding(2)
                                .frame(width:geometry.size.width / 2 - 90, alignment: .leading)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            AddMealButton(weight: .light, type: .vegetarian, context: self.managedObjectContext)
                            AddMealButton(weight: .medium, type: .vegetarian, context: self.managedObjectContext)
                            AddMealButton(weight: .heavy, type: .vegetarian, context: self.managedObjectContext)
                            Spacer()
                        }.frame(alignment: .center)
                    }
                }.frame( height: 64, alignment: .center)
                HStack {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            Text("\(Type.meat.stringValue.capitalized)?")
                                .padding(2)
                                .frame(width: geometry.size.width / 2 - 90, alignment: .leading)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            AddMealButton(weight: .light, type: .meat, context: self.managedObjectContext)
                            AddMealButton(weight: .medium, type: .meat, context: self.managedObjectContext)
                            AddMealButton(weight: .heavy, type: .meat, context: self.managedObjectContext)
                            Spacer()
                        }.frame(alignment: .center)
                    }
                }.frame( height: 64, alignment: .center)
            }
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
