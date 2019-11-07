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
    @EnvironmentObject var mealState: MealState
    var day: Day
    private var typeCounts: [Int] {
        let dayStart = Calendar.current.startOfDay(for: day.date)
        let dayEnd: Date = {
          let components = DateComponents(day: 1, second: -1)
          return Calendar.current.date(byAdding: components, to: dayStart)!
        }()
        return [
            mealState
                .mealsResult
                .filter("typeString = '\(Type.vegan.stringValue)' AND timestamp BETWEEN %@", [dayStart, dayEnd])
                .count,
            mealState
                .mealsResult
                .filter("typeString = '\(Type.vegetarian.stringValue)' AND timestamp BETWEEN %@", [dayStart, dayEnd])
                .count,
            mealState
                .mealsResult
                .filter("typeString = '\(Type.meat.stringValue)' AND timestamp BETWEEN %@", [dayStart, dayEnd])
                .count
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
        VStack(alignment: .leading, spacing: 0) {
            Text(self.day.dateString).font(.title)
            HStack {
                Text("\(Type.vegan.stringValue):")
                    .frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[0], id: \.self) {_ in
                    Type.vegan.icon
                        .resizable()
                        .foregroundColor(Type.vegan.color)
                        .frame(width: 16, height: 16, alignment: .center)
                }
            }
            HStack {
                Text("\(Type.vegetarian.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[1], id: \.self) {_ in
                    Type.vegetarian.icon
                        .resizable()
                        .foregroundColor(Type.vegetarian.color)
                        .frame(width: 16, height: 16, alignment: .center)
                }
            }
            HStack {
                Text("\(Type.meat.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[2], id: \.self) {_ in
                    Type.meat.icon
                        .resizable()
                        .foregroundColor(Type.meat.color)
                        .frame(width: 16, height: 16, alignment: .center)
                }
            }
            GeometryReader { geometry in
                HStack {
                    Text("\(self.day.meals.count) \(self.day.mealsString) from \(self.sumCaloriesMin) to \(self.sumCaloriesMax) calories. Average:")
                        .foregroundColor(Color(UIColor.systemGray))
                        .italic()
                    Text(self.averageCalories)
                        .bold()
                }
                .font(.footnote)
                .frame(width: geometry.size.width, height: nil, alignment: .trailing)
                .padding(Edge.Set(.top), 10)
            }
        }.padding(Edge.Set(.bottom), 10)
    }
}

//struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
//}
