//
//  AddMealButton.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct AddMealButton: View {
    private let viewModel = AddMealViewModel()
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
                type.icon
                    .resizable()
                    .frame(
                        width: 20 * CGFloat(weight.intValue),
                        height: 20 * CGFloat(weight.intValue)
                    )
            }
            .frame(width: 60, alignment: .center)
        }
    }
}
