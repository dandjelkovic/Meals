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

    var weight: Weight
    var type: MealType

    var body: some View {
        Button(
            action: {
                let mealModel = MealModel(
                    weight: weight,
                    type: type
                )
                viewModel.addMeal(mealModel)
            }
        ) {
            VStack {
                if viewModel.mealSaved {
                    Image(systemName: "checkmark")
                    // TODO: Add timer to hide checkmark again
                } else {
                    type.icon
                        .resizable()
                        .frame(
                            width: 20 * CGFloat(weight.intValue),
                            height: 20 * CGFloat(weight.intValue)
                        )
                }
            }
            .frame(width: 60, alignment: .center)
        }
    }
}
