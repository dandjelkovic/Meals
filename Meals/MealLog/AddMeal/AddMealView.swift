//
//  AddMealView.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 05.12.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI

// This View is shared with WatchApp
struct AddMealView: View {
    var body: some View {
        Grid {
            GridRow {
                if Current.deviceIs_iOS {
                    Text("\(MealType.vegan.stringValue.capitalized)")
                }
                AddMealButton(weight: .light, type: .vegan)
                AddMealButton(weight: .medium, type: .vegan)
                AddMealButton(weight: .heavy, type: .vegan)
            }
            GridRow {
                if Current.deviceIs_iOS {
                    Text("\(MealType.vegetarian.stringValue.capitalized)")
                }
                AddMealButton(weight: .light, type: .vegetarian)
                AddMealButton(weight: .medium, type: .vegetarian)
                AddMealButton(weight: .heavy, type: .vegetarian)
            }
            GridRow {
                if Current.deviceIs_iOS {
                    Text("\(MealType.meat.stringValue.capitalized)")
                }
                AddMealButton(weight: .light, type: .meat)
                AddMealButton(weight: .medium, type: .meat)
                AddMealButton(weight: .heavy, type: .meat)
            }
        }
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
}
