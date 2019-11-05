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
    private var sumCaloriesMin: String {
        let weightsArray = day.meals.map{ $0.weight }
        let sum = weightsArray.reduce(0, {$0 + $1.minCalories})
        return String("\(sum) kCal")
    }
    
    private var sumCaloriesMax: String {
        let weightsArray = day.meals.map{ $0.weight }
        let sum = weightsArray.reduce(0, {$0 + $1.maxCalories})
        return String("\(sum) kCal")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.day.dateString).font(.largeTitle)
            HStack {
                Text("\(Type.vegan.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[0], id: \.self) {_ in
                    Image(systemName: "circle.fill").foregroundColor(Type.vegan.color).frame(width: 12, height: nil, alignment: .center)
                }
            }
            HStack {
                Text("\(Type.vegetarian.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[1], id: \.self) {_ in
                    Image(systemName: "rhombus.fill").foregroundColor(Type.vegetarian.color).frame(width: 12, height: nil, alignment: .center)
                }
            }
            HStack {
                Text("\(Type.meat.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[2], id: \.self) {_ in
                    Image(systemName: "stop.fill").foregroundColor(Type.meat.color).frame(width: 12, height: nil, alignment: .center)
                }
            }
            Text("Sum: \(sumCaloriesMin) - \(sumCaloriesMax) calories")
        }.padding(Edge.Set(.bottom), 20)
    }
}

//struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
//}
