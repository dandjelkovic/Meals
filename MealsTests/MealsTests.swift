//
//  MealsTests.swift
//  MealsTests
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import XCTest
import CoreData
@testable import Meals

// swiftlint:disable force_unwrapping
class MealsTests: XCTestCase {
    // swiftlint:disable implicitly_unwrapped_optional
    var managedObjectContext: NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        // swiftlint:disable:next force_cast
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let today = Current.date()
        for _ in 1...3 {
            let meal = Meal(entity: Meal.entity(), insertInto: managedObjectContext)
            meal.weight = [Weight.light, Weight.medium, Weight.heavy].randomElement()!
            meal.timestamp = today
            do {
                try managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        for _ in 1...3 {
            let meal = Meal(entity: Meal.entity(), insertInto: managedObjectContext)
            meal.weight = [Weight.light, Weight.medium, Weight.heavy].randomElement()!
            meal.timestamp = Calendar.current.date(byAdding: .day, value: -1, to: today)!
            do {
                try managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        for _ in 1...3 {
            let meal = Meal(entity: Meal.entity(), insertInto: managedObjectContext)
            meal.weight = [Weight.light, Weight.medium, Weight.heavy].randomElement()!
            meal.timestamp = Calendar.current.date(byAdding: .day, value: -2, to: today)!
            do {
                try managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }

        lookupMeals()
    }

    private func lookupMeals() {
        do {
            let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            print(fetchedResults)

        } catch {
            print("fetch task failed", error)
        }
    }

    override func tearDown() {
        managedObjectContext = nil
        super.tearDown()
    }

}
