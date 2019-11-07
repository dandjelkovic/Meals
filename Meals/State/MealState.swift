//
//  MealState.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 07.11.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation
import Combine
import RealmSwift

final class MealState: ObservableObject {
    @Published var meals: [Meal]
    private var mealsToken: NotificationToken?

    init() {
        let realm = try! Realm()
        let results = realm.objects(Meal.self).sorted(byKeyPath: "timestamp", ascending: false)
        meals = Array(results)
        activateMealsToken()
    }

    private func activateMealsToken() {
        let realm = try! Realm()
        let results = realm.objects(Meal.self).sorted(byKeyPath: "timestamp", ascending: false)
        mealsToken = results.observe { _ in
            // When there is a change, replace the old channels array with a new one.
            self.meals = Array(results)
        }
    }

    deinit {
        mealsToken?.invalidate()
    }
}
