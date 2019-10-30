//
//  ContentView.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
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
        }.sorted { (day1, day2) -> Bool in
            day1.date > day2.date
        }
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            MealLog(days: days)
                .tabItem {
                    Image(systemName: "book")
                    Text("Meals")
            }
            .tag(0)
            Statistics(days: days)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Statistics")
            }
            .tag(1)
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
