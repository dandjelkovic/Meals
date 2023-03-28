//
//  AddMealButton.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

// This View is shared with WatchApp
struct AddMealButton: View {
#if os(iOS)
    @StateObject private var viewModel = AddMealButtonViewModel()
#endif
#if os(watchOS)
    @StateObject private var viewModel = AddMealButtonWatchViewModel()
#endif

    @State var isLoading = false

    var weight: Weight
    var type: MealType

    var body: some View {
        Button(
            action: {
                isLoading = true
                let mealModel = MealModel(
                    weight: weight,
                    type: type
                )
                viewModel.addMeal(mealModel)
            }
        ) {
            VStack {
                switch (viewModel.viewState, viewModel.showSavedConfirmation) {
                case (.loading, _):
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                case (_, true):
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                        .bold()
                        .frame(
                            width: viewModel.iconSizeForWeight(weight),
                            height: viewModel.iconSizeForWeight(weight)
                        )
                case (.ready, false):
                    type.icon
                        .resizable()
                        .frame(
                            width: viewModel.iconSizeForWeight(weight),
                            height: viewModel.iconSizeForWeight(weight)
                        )
                        .transition(
                            .asymmetric(
                                insertion: .opacity.animation(.easeIn(duration: 0.4)),
                                removal: .opacity.animation(.none)
                            )
                        )
                }
            }
            .frame(alignment: .center)
        }
    }
}
