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
//    @Environment(\.managedObjectContext)
//    var context
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.timestamp, ascending: false)
        ]
    )
    var meals: FetchedResults<Meal>
    var days: [Day] {
        var daysDictionary = [Date: [Meal]]()
        var dates = [Date]()

        print(meals)
        meals.forEach { meal in
            let components = Calendar.current.dateComponents([.year,.month,.day], from: meal.timestamp!)
            dates.append(Calendar.current.date(from: components)!)
        }
        dates.forEach { date in
            daysDictionary[date] = meals.filter {
                let components = Calendar.current.dateComponents([.year,.month,.day], from: $0.timestamp!)
                return date == Calendar.current.date(from: components)
            }
        }

        return daysDictionary.map { (date, meals) in
            return Day(date: date, meals: meals)
        }
    }
    var daysByRowOfThree: [[Day]] {
        days.compactMap { day in
            var columns = [Day]()
            columns.append(day)
            guard days.count >= 3 else {
                return days
            }
            if columns.count == 3 {
                return columns
            }
            return nil
        }
    }

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(daysByRowOfThree, id: \.self) { sortedDays in
                StatisticsRow(days: sortedDays)
            }
        }
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}
