//
//  AddMealViewModel.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 23.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//
import CoreData
import UIKit

struct AddMealViewModel: AddMealViewModelProtocol {
    private var context: NSManagedObjectContext?

    init() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.context = appDelegate.persistentContainer.viewContext
        }
    }

    func addMeal(_ meal: MealModel) {
        guard let context else { return }
        let newMealEntry = Meal(context: context)
        newMealEntry.weight = meal.weight
        newMealEntry.timestamp = meal.timestamp
        newMealEntry.type = meal.type
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
