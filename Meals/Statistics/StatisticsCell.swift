//
//  StatisticsCell.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import Foundation

struct StatisticsCell: View {
    @Environment(\.managedObjectContext)
    var managedObjectContext

    var day: Day
    private var typeCounts: [MealType: Int] {
        [
            MealType.vegan: day.meals.filter { meal in meal.type == MealType.vegan }.count,
            MealType.vegetarian: day.meals.filter { meal in meal.type == MealType.vegetarian }.count,
            MealType.meat: day.meals.filter { meal in meal.type == MealType.meat }.count
        ]
    }
    private var sumCalories: Int {
        let weightsArray = day.meals.map { $0.weight }
        return weightsArray.reduce(0) { $0 + $1.caloriesCount(context: managedObjectContext) }
    }
    private var sumCaloriesString: String {
        String("\(sumCalories) kCal")
    }

    var body: some View {
        HStack {
            VStack {
                HStack {
                    MealType.vegan.iconScaledBy(count: typeCounts[MealType.vegan] ?? 0)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                }
                HStack {
                    MealType.vegetarian.iconScaledBy(count: typeCounts[MealType.vegetarian] ?? 0)
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    MealType.meat.iconScaledBy(count: typeCounts[MealType.meat] ?? 0)
                        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 10))
                }
            }
            .frame(width: 100, height: 100)
            .clipped()
            .background(CirlceBackground())
            VStack {
                HStack {
                    Text(day.dateString).font(.headline)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("\(day.meals.count) \(day.mealsString). Average: ")
                        .foregroundColor(Color(UIColor.systemGray))
                        .italic()
                        + Text(sumCaloriesString).bold()
                    Spacer()
                }
            }
        }
        .padding(Edge.Set(.bottom), 5)
    }
}

struct CirlceBackground: View {
    var body: some View {
        Circle()
            .fill(Color(UIColor.systemGray5))
            .frame(width: 100, height: 100)
    }
}

// struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
// }
