//
//  Statistics.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import Foundation

struct Statistics: View {
    var days = [Day]()
    private var counts: [Int] {
        return [
            days.prefix(30).map{ $0.meals }.joined().filter{ meal in meal.type == Type.vegan }.count,
            days.prefix(30).map{ $0.meals }.joined().filter{ meal in meal.type == Type.vegetarian }.count,
            days.prefix(30).map{ $0.meals }.joined().filter{ meal in meal.type == Type.meat }.count
        ]
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meals in the last 30 days").font(.caption)
            HStack {
                Text("\(Type.vegan.stringValue):").frame(width: 100, height: 20, alignment: .leading).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle().frame(width: CGFloat(3 * counts[0]), height: 20, alignment: .leading).foregroundColor(Type.vegan.color)
                Text(String(counts[0]))
            }
            HStack {
                Text("\(Type.vegetarian.stringValue):").frame(width: 100, height: 20, alignment: .leading).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle().frame(width: CGFloat(3 * counts[1]), height: 20, alignment: .leading).foregroundColor(Type.vegetarian.color)
                Text(String(counts[1]))
            }
            HStack {
                Text("\(Type.meat.stringValue):").frame(width: 100, height: 20, alignment: .leading).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle().frame(width: CGFloat(3 * counts[2]), height: 20, alignment: .leading).foregroundColor(Type.meat.color)
                Text(String(counts[2]))
            }
            List(self.days, id: \.self) { day in
                StatisticsCell(day: day)
            }
        }
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
