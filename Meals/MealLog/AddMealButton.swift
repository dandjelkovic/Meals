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
        Button( action: {
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
        }) {
            VStack {
                weight.image
                Text(type.stringValue)
                    .foregroundColor(Color(UIColor.label))
                    .bold()
                    .font(.system(size: 12))
            }
            .padding()
        }
    }
}
