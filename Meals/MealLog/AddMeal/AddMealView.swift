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
    private var padding: CGFloat {
        if Current.deviceIs_iOS {
            return 10
        } else {
            return 0
        }
    }
    var body: some View {
        Grid {
            GridRow {
                if Current.deviceIs_iOS {
                    Text("\(MealType.vegan.stringValue.capitalized)")
                }
                AddMealButton(weight: .light, type: .vegan)
                    .padding(.horizontal, padding)
                AddMealButton(weight: .medium, type: .vegan)
                    .padding(.horizontal, padding)
                AddMealButton(weight: .heavy, type: .vegan)
                    .padding(.horizontal, padding)
            }
            GridRow {
                if Current.deviceIs_iOS {
                    Text("\(MealType.vegetarian.stringValue.capitalized)")
                }
                AddMealButton(weight: .light, type: .vegetarian)
                    .padding(.horizontal, padding)
                AddMealButton(weight: .medium, type: .vegetarian)
                    .padding(.horizontal, padding)
                AddMealButton(weight: .heavy, type: .vegetarian)
                    .padding(.horizontal, padding)
            }
            GridRow {
                if Current.deviceIs_iOS {
                    Text("\(MealType.meat.stringValue.capitalized)")
                }
                AddMealButton(weight: .light, type: .meat)
                    .padding(.horizontal, padding)
                AddMealButton(weight: .medium, type: .meat)
                    .padding(.horizontal, padding)
                AddMealButton(weight: .heavy, type: .meat)
                    .padding(.horizontal, padding)
            }
        }
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
}
