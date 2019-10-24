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
    private var opacity: Double {
        min(Double(day.meals.count)/10.0, 1)
    }
    private var typeCounts: [Int] {
        return [
            day.meals.filter{ meal in meal.type == Type.vegan }.count,
            day.meals.filter{ meal in meal.type == Type.vegetarian }.count,
            day.meals.filter{ meal in meal.type == Type.meat }.count
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.day.dateString).font(.largeTitle)
            HStack {
                Text("\(Type.vegan.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[0], id: \.self) {_ in
                    Image(systemName: "circle.fill").foregroundColor(.green)
                }
            }
            HStack {
                Text("\(Type.vegetarian.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[1], id: \.self) {_ in
                    Image(systemName: "circle.fill").foregroundColor(.yellow)
                }
            }
            HStack {
                Text("\(Type.meat.stringValue):").frame(width: 120, height: nil, alignment: .trailing)
                ForEach(0..<typeCounts[2], id: \.self) {_ in
                    Image(systemName: "circle.fill").foregroundColor(.red)
                }
            }
            //            Text(String(opacity))
            //            Path(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 10))
            //                .fill(
            //                    Color(
            //                        Color.RGBColorSpace.displayP3,
            //                        red: 1.0,
            //                        green: 0.0,
            //                        blue: 0.0,
            //                        opacity: opacity
            //                    )
            //            )
        }.padding(Edge.Set(.bottom), 20)


    }
}

//struct StatisticsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsCell()
//    }
//}
