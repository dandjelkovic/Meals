//
//  MealCell.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

struct MealCell: View {
    var meal: Meal

    var body: some View {
        HStack {
            meal.type.icon
                .resizable()
                .frame(width: 24, height: 24)
            Text(meal.weight.stringValue)
            Spacer()
            Text(meal.timeString)
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
    }
}

struct MealCell_Previews: PreviewProvider {
    static var previews: some View {
        let meal = Meal()
        return MealCell(meal: meal)
    }
}
