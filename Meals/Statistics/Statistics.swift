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

    private var numberOfAllMeals: String {
        String(days.map { $0.meals }.joined().count)
    }

    private var dateOfFirstMeal: String {
        guard !days.isEmpty else { return "" }
        return days.sorted { day1, day2 -> Bool in
            day1.date < day2.date
        }[0].shortDateString
    }
    private let multiplierForBars: CGFloat = 3.5
    private var selectableDays: [Int] {
        [1, 7, 30]
    }
    private var selectableDaysStrings: [String] {
        [
            "day",
            NumberFormatter.localizedString(
                from: selectableDays[selectedNumberOfDays] as NSNumber, number: .spellOut)
                + " days",
            "30 days"
        ]
    }
    @State private var selectedNumberOfDays = 1
    private var counts: [Int] {
        [
            days
                .prefix(selectableDays[selectedNumberOfDays])
                .map { $0.meals }
                .joined()
                .filter { meal in
                    meal.type == Type.vegan
                }
                .count,
            days
                .prefix(selectableDays[selectedNumberOfDays])
                .map { $0.meals }
                .joined()
                .filter { meal in
                    meal.type == Type.vegetarian
                }
                .count,
            days
                .prefix(selectableDays[selectedNumberOfDays])
                .map { $0.meals }
                .joined()
                .filter { meal in
                    meal.type == Type.meat
                }
                .count
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
            }
            .pickerStyle(SegmentedPickerStyle())
            .id(1)
            HStack {
                Text("\(Type.vegan.stringValue):")
                    .frame(width: 100, height: 20, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle()
                    .frame(width: multiplierForBars * CGFloat(counts[0]), height: 20, alignment: .leading)
                    .foregroundColor(Type.vegan.color)
                Text(String(counts[0]))
            }
            HStack {
                Text("\(Type.vegetarian.stringValue):")
                    .frame(width: 100, height: 20, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle()
                    .frame(width: multiplierForBars * CGFloat(counts[1]), height: 20, alignment: .leading)
                    .foregroundColor(Type.vegetarian.color)
                Text(String(counts[1]))
            }
            HStack {
                Text("\(Type.meat.stringValue):")
                    .frame(width: 100, height: 20, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Rectangle()
                    .frame(width: multiplierForBars * CGFloat(counts[2]), height: 20, alignment: .leading)
                    .foregroundColor(Type.meat.color)
                Text(String(counts[2]))
            }
            HStack {
                Spacer()
                Text("\(numberOfAllMeals) meals since \(dateOfFirstMeal)")
                    .font(.footnote)
                Spacer()
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
