//
//  AddMealViewModel.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 23.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//
import CoreData
import UIKit

class AddMealButtonViewModel: AddMealButtonViewModelProtocol, ObservableObject {
    @Published private(set) var showSavedConfirmation = false
    @Published private(set) var viewState = ViewState.ready
    private var animationDuration = 1.2
    private var context: NSManagedObjectContext?

    init() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.context = appDelegate.persistentContainer.viewContext
        }
    }

    func addMeal(_ meal: MealModel) {
        guard let context else {
            print("NSManagedObjectContext is nil")
            return
        }
        viewState = .loading

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
            self.showSavedConfirmation = true
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration) {
                self.showSavedConfirmation = false
            }
            self.viewState = .ready
        }
    }

    func iconSizeForWeight(_ weight: Weight) -> CGFloat {
        20 * CGFloat(weight.intValue)
    }
}
