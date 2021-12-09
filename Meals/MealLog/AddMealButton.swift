//
//  AddMealButton.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import CoreData

struct AddMealButton: View {
    var weight: Weight
    var type: Type
    var context: NSManagedObjectContext

    var body: some View {
        Button(
            action: {
                let newMealEntry = Meal(context: self.context)
                newMealEntry.weight = self.weight
                newMealEntry.timestamp = Current.date()
                newMealEntry.type = self.type
                if self.context.hasChanges {
                    do {
                        try self.context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        // swiftlint:disable multiple_closures_with_trailing_closure
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
