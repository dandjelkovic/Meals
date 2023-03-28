//
//  AddMealWatchViewModel.swift
//  MealsOnWatch Watch App
//
//  Created by Dalibor Andjelkovic on 23.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import WatchConnectivity

class AddMealButtonWatchViewModel: AddMealButtonViewModelProtocol, ObservableObject {
    @Published private(set) var showSavedConfirmation = false
    @Published private(set) var viewState = ViewState.ready
    private var confirmationDuration = 1.2

    func addMeal(_ meal: MealModel) {
        viewState = .loading
        sendMealToParent(meal: meal)
    }

    private func sendMealToParent(meal: MealModel) {
        guard WCSession.default.isReachable else {
            return
        }

        let wcMessage = meal.toDict()

        WCSession.default.sendMessage(
            wcMessage,
            replyHandler: { [weak self] _ in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.showSavedConfirmation = true
                    self.viewState = .ready
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + self.confirmationDuration) {
                    self.showSavedConfirmation = false
                }
            },
            errorHandler: { error in
                print(#function, error.localizedDescription)
                self.viewState = .ready
            }
        )
    }

    func iconSizeForWeight(_ weight: Weight) -> CGFloat {
        20 * CGFloat(weight.intValue) / 1.8
    }
}
