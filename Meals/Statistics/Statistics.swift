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
    private var multiplierForBars: CGFloat {
        3.5
    }
    private var selectableDays: [Int] {
        [1, 7, 30]
    }
    private var selectableDaysStrings: [String] {
        [
            "day",
            NumberFormatter.localizedString(from: NSNumber(integerLiteral: selectableDays[selectedNumberOfDays]), number: .spellOut) + " days",
            "30 days",
        ]
    }
    @State private var selectedNumberOfDays = 1
    private var counts: [Int] {
        return [
            days.prefix(selectableDays[selectedNumberOfDays]).map{ $0.meals }.joined().filter{ meal in meal.type == Type.vegan }.count,
            days.prefix(selectableDays[selectedNumberOfDays]).map{ $0.meals }.joined().filter{ meal in meal.type == Type.vegetarian }.count,
            days.prefix(selectableDays[selectedNumberOfDays]).map{ $0.meals }.joined().filter{ meal in meal.type == Type.meat }.count
        ]
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meals in the last \(selectableDaysStrings[selectedNumberOfDays])").font(.caption)
            Picker(selection: $selectedNumberOfDays, label: Text("Select a Range")) {
                ForEach(0 ..< selectableDays.count) { index in
                    Text(String(self.selectableDays[index]))
                        .tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            HStack {
                Text("\(Type.vegan.stringValue):").frame(width: 100, height: 20, alignment: .leading).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle().frame(width: multiplierForBars * CGFloat(counts[0]), height: 20, alignment: .leading).foregroundColor(Type.vegan.color)
                Text(String(counts[0]))
            }
            HStack {
                Text("\(Type.vegetarian.stringValue):").frame(width: 100, height: 20, alignment: .leading).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle().frame(width: multiplierForBars * CGFloat(counts[1]), height: 20, alignment: .leading).foregroundColor(Type.vegetarian.color)
                Text(String(counts[1]))
            }
            HStack {
                Text("\(Type.meat.stringValue):").frame(width: 100, height: 20, alignment: .leading).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle().frame(width: multiplierForBars * CGFloat(counts[2]), height: 20, alignment: .leading).foregroundColor(Type.meat.color)
                Text(String(counts[2]))
            }
            Text("All Meals").font(.title)
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
