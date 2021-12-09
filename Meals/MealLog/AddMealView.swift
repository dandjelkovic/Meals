//
//  AddMealView.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 05.12.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import CoreData

struct AddMealView: View {
    var context: NSManagedObjectContext

    var body: some View {
        VStack {
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Text("\(Type.vegan.stringValue.capitalized)?")
                            .padding(2)
                            .frame(width: geometry.size.width / 2 - 90, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        AddMealButton(weight: .light, type: .vegan, context: self.context)
                        AddMealButton(weight: .medium, type: .vegan, context: self.context)
                        AddMealButton(weight: .heavy, type: .vegan, context: self.context)
                        Spacer()
                    }.frame(alignment: .center)
                }
            }.frame( height: 64, alignment: .center)
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Text("\(Type.vegetarian.stringValue.capitalized)?")
                            .padding(2)
                            .frame(width: geometry.size.width / 2 - 90, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        AddMealButton(weight: .light, type: .vegetarian, context: self.context)
                        AddMealButton(weight: .medium, type: .vegetarian, context: self.context)
                        AddMealButton(weight: .heavy, type: .vegetarian, context: self.context)
                        Spacer()
                    }.frame(alignment: .center)
                }
            }.frame( height: 64, alignment: .center)
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Text("\(Type.meat.stringValue.capitalized)?")
                            .padding(2)
                            .frame(width: geometry.size.width / 2 - 90, alignment: .leading)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        AddMealButton(weight: .light, type: .meat, context: self.context)
                        AddMealButton(weight: .medium, type: .meat, context: self.context)
                        AddMealButton(weight: .heavy, type: .meat, context: self.context)
                        Spacer()
                    }.frame(alignment: .center)
                }
            }.frame( height: 64, alignment: .center)
        }
    }
}

// struct AddMealView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMealView(context: context)
//    }
// }
