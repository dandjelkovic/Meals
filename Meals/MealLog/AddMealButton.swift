//
//  AddMealButton.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import SwiftUI
import RealmSwift

struct AddMealButton: View {
    var weight: Weight
    var type: Type

    var body: some View {
        Button( action: {
            let newMealEntry = Meal()
            newMealEntry.weight = self.weight
            newMealEntry.timestamp = Current.date()
            newMealEntry.type = self.type
            Current.setupSyncedRealm { realm in
                do {
                    try realm.write {
                        realm.add(newMealEntry)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }

        }) {
            VStack {
//                Spacer()
                type.icon
                    .resizable()
                    .frame(width: 20 * CGFloat(weight.intValue), height: 20 * CGFloat(weight.intValue))
//                Spacer()
            }.frame(width: 60, height: nil, alignment: .center)
        }
    }
}
