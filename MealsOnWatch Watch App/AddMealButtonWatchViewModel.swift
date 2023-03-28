//
//  AddMealWatchViewModel.swift
//  MealsOnWatch Watch App
//
//  Created by Dalibor Andjelkovic on 23.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import WatchConnectivity

class AddMealButtonWatchViewModel: AddMealButtonViewModelProtocol, ObservableObject {
    @Published var mealSaved = false
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
            replyHandler: { [weak self] replyMessage in
                print(#function, "reply received", replyMessage)
                guard let self else { return }
                self.mealSaved = true
            },
            errorHandler: { error in
                print(#function, error.localizedDescription)
            }
        )
    }
}
