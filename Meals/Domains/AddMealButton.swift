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
    var context: NSManagedObjectContext
    
    var body: some View {
        Button( action: {
            let newMealEntry = Meal(context: self.context)
            newMealEntry.weight = self.weight
            newMealEntry.timestamp = Current.date()
            if self.context.hasChanges {
                do {
                    try self.context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }) {
            Image(systemName: "plus.rectangle")
            Text(verbatim: weight.shortStringValue)
                .font(.callout)
                .padding()
        }
    }
}
