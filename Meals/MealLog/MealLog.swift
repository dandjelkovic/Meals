//
//  MealLog.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import RealmSwift

struct MealLog: View {
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
                            Current.setupSyncedRealm { realm in
                                do {
                                    try realm.write {
                                        realm.delete(day.meals[indexFirst])
                                    }
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
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
                            TypeTag(type: .vegan, color: Type.vegan.color)
                                .padding(2)
                                .frame(width: geometry.size.width / 2 - 90, height: nil, alignment: .leading)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            AddMealButton(weight: .light, type: .vegan)
                            AddMealButton(weight: .medium, type: .vegan)
                            AddMealButton(weight: .heavy, type: .vegan)
                            Spacer()
                        }.frame(width: nil, height: nil, alignment: .center)
                    }
                }.frame(width: nil, height: 64, alignment: .center)
                HStack {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            TypeTag(type: .vegetarian, color: Type.vegetarian.color)
                                .padding(2)
                                .frame(width:geometry.size.width / 2 - 90, height: nil, alignment: .leading)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            AddMealButton(weight: .light, type: .vegetarian)
                            AddMealButton(weight: .medium, type: .vegetarian)
                            AddMealButton(weight: .heavy, type: .vegetarian)
                            Spacer()
                            }.frame(width: nil, height: nil, alignment: .center)
                    }
                }.frame(width: nil, height: 64, alignment: .center)
                HStack {
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            TypeTag(type: .meat, color: Type.meat.color)
                                .padding(2)
                                .frame(width: geometry.size.width / 2 - 90, height: nil, alignment: .leading)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            AddMealButton(weight: .light, type: .meat)
                            AddMealButton(weight: .medium, type: .meat)
                            AddMealButton(weight: .heavy, type: .meat)
                            Spacer()
                        }.frame(width: nil, height: nil, alignment: .center)
                    }
                }.frame(width: nil, height: 64, alignment: .center)
            }
        }
    }
}

//struct MealLog_Previews: PreviewProvider {
//    static var previews: some View {
//        MealLog()
//    }
//}
