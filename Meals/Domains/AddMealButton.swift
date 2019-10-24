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
            //            Image(systemName: "plus.rectangle")
            VStack {
                Text(verbatim: weight.shortStringValue)
                    .bold()
                Text(verbatim: type.stringValue)
                    .font(Font.system(size: 11))
                .padding(2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.blue, lineWidth: 1)
                )
            }
            .font(.callout)
            .padding()

        }
    }
}
