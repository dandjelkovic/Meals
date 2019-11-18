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
    var day: Day
    private var typeCounts: [Int] {
        return [
            day.meals.filter{ meal in meal.type == Type.vegan }.count,
            day.meals.filter{ meal in meal.type == Type.vegetarian }.count,
            day.meals.filter{ meal in meal.type == Type.meat }.count
        ]
    }
    private var sumCaloriesMin: Int {
        let weightsArray = day.meals.map{ $0.weight }
        return weightsArray.reduce(0, {$0 + $1.minCalories})
    }
    
    private var sumCaloriesMax: Int {
        let weightsArray = day.meals.map{ $0.weight }
        return weightsArray.reduce(0, {$0 + $1.maxCalories})
    }
    private var sumCaloriesMinString: String {
        return String("\(sumCaloriesMin) kCal")
    }
    
    private var sumCaloriesMaxString: String {
        return String("\(sumCaloriesMax) kCal")
    }
    private var averageCalories: String {
        return String((sumCaloriesMax + sumCaloriesMin) / 2) + " kCal"
    }
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Type.vegan.iconScaledBy(count: typeCounts[0])
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
//                    Spacer()
                }
                HStack {
//                    Spacer()
                    Type.vegetarian.iconScaledBy(count: typeCounts[1])
//                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                    Spacer()
//                }
//                HStack {
//                    Spacer()
                    Type.meat.iconScaledBy(count: typeCounts[2])
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }.frame(width: 120).clipped()
            VStack {
                HStack {
                    Text(self.day.dateString).font(.headline)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("\(self.day.meals.count) \(self.day.mealsString) from \(self.sumCaloriesMin) to \(self.sumCaloriesMax) calories. Average: ")
                        .foregroundColor(Color(UIColor.systemGray))
                        .italic()
                        + Text(self.averageCalories).bold()
                    Spacer()
                }
            }
        }
        .padding(Edge.Set(.bottom), 5)
    }
}

//struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
//}
