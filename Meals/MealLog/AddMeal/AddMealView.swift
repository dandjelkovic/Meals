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
        VStack {
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Text("\(MealType.vegan.stringValue.capitalized)?")
                            .padding(2)
                            .frame(width: geometry.size.width / 2 - 90, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        AddMealButton(weight: .light, type: .vegan)
                        AddMealButton(weight: .medium, type: .vegan)
                        AddMealButton(weight: .heavy, type: .vegan)
                        Spacer()
                    }
                    .frame(alignment: .center)
                }
            }
            .frame(height: 64, alignment: .center)
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Text("\(MealType.vegetarian.stringValue.capitalized)?")
                            .padding(2)
                            .frame(width: geometry.size.width / 2 - 90, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        AddMealButton(weight: .light, type: .vegetarian)
                        AddMealButton(weight: .medium, type: .vegetarian)
                        AddMealButton(weight: .heavy, type: .vegetarian)
                        Spacer()
                    }
                    .frame(alignment: .center)
                }
            }
            .frame(height: 64, alignment: .center)
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Text("\(MealType.meat.stringValue.capitalized)?")
                            .padding(2)
                            .frame(width: geometry.size.width / 2 - 90, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        AddMealButton(weight: .light, type: .meat)
                        AddMealButton(weight: .medium, type: .meat)
                        AddMealButton(weight: .heavy, type: .meat)
                        Spacer()
                    }
                    .frame(alignment: .center)
                }
            }
            .frame(height: 64, alignment: .center)
        }
    }
}

 struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
 }
