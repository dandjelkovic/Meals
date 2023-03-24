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
    @State private var selectedTab = 0
    @Environment(\.managedObjectContext)
    var managedObjectContext
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Meal.timestamp, ascending: false)
        ]
    )
    var meals: FetchedResults<Meal>

    // add publisher for meals added from WatchApp
    private let wcMessagePublisher = NotificationCenter.default.publisher(
        for: NotificationType.receiveNewMeal.notification
    )

    var days: [Day] {
        var daysDictionary = [Date: [Meal]]()
        var dates = [Date]()

        meals.forEach { meal in
            let components = Calendar.current.dateComponents(
                [.year, .month, .day],
                // swiftlint:disable:next force_unwrapping
                from: meal.timestamp!
            )
            // swiftlint:disable:next force_unwrapping
            dates.append(Calendar.current.date(from: components)!)
        }
        dates.forEach { date in
            daysDictionary[date] = meals.filter {
                let components = Calendar.current.dateComponents(
                    [.year, .month, .day],
                    // swiftlint:disable:next force_unwrapping
                    from: $0.timestamp!
                )
                return date == Calendar.current.date(from: components)
            }
        }

        return daysDictionary.map { date, meals in
            Day(date: date, meals: meals)
        }.sorted { day1, day2 -> Bool in
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
            Settings()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
                }
                .tag(2)
        }
        .onReceive(wcMessagePublisher) { output in
            if let userInfo = output.userInfo {
                saveAddedMeal(userInfo)
            }

        }
    }

    private func saveAddedMeal(_ userInfo: [AnyHashable: Any]) {
        let meal = MealModel.fromDict(dict: userInfo)
        let newMealEntry = Meal(context: managedObjectContext)
        newMealEntry.weight = meal.weight
        newMealEntry.timestamp = meal.timestamp
        newMealEntry.type = meal.type
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
