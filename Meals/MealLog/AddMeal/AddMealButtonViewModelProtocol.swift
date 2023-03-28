//
//  AddMealViewModelProtocol.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 23.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import Foundation

// This Protocol is shared with the WatchApp
protocol AddMealButtonViewModelProtocol {
    func addMeal(_ meal: MealModel)
    func iconSizeForWeight(_ weight: Weight) -> CGFloat
}
