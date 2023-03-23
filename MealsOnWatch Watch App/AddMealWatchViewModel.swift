//
//  AddMealWatchViewModel.swift
//  MealsOnWatch Watch App
//
//  Created by Dalibor Andjelkovic on 23.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import WatchConnectivity

struct AddMealWatchViewModel: AddMealViewModelProtocol {
    func addMeal(_ meal: MealModel) {
        sendMealToParent(meal: meal)
    }

    private func sendMealToParent(meal: MealModel) {
        guard WCSession.default.isReachable else {
            return
        }

        let wcMessage = meal.toDict()

        WCSession.default.sendMessage(
            wcMessage,
            replyHandler: nil,
            errorHandler: { error in
                print(error.localizedDescription)
            }
        )
    }
}
