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
    private var typeCounts: [Type: Int] {
        return [
            Type.vegan: day.meals.filter{ meal in meal.type == Type.vegan }.count,
            Type.vegetarian: day.meals.filter{ meal in meal.type == Type.vegetarian }.count,
            Type.meat: day.meals.filter{ meal in meal.type == Type.meat }.count
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
                    Type.vegan.iconScaledBy(count: typeCounts[Type.vegan]!)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                }
                HStack {
                    Type.vegetarian.iconScaledBy(count: typeCounts[Type.vegetarian]!)
                    Type.meat.iconScaledBy(count: typeCounts[Type.meat]!)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }
            }
            .frame(width: 120, height: 100)
            .clipped()
            .background(CirlceBackground())
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

struct CirlceBackground: View {
    var body: some View {
        Circle()
            .fill(Color(UIColor.systemGray5))
            .frame(width: 100, height: 100)
    }
}

//struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
//}
