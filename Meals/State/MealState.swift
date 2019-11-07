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
    @Published var meals = [Meal]()
    @Published var mealsResult: RealmSwift.Results<Meal>?
    private var mealsToken: NotificationToken?
    private var realm: Realm!

    init() {
        Current.setupSyncedRealm { realm in
            let results = realm.objects(Meal.self).sorted(byKeyPath: "timestamp", ascending: false)
            self.mealsResult = results
            self.meals = Array(results)
            self.realm = realm
            self.activateMealsToken()
        }
    }

    private func activateMealsToken() {
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
