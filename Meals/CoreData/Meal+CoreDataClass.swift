//
//  Meal+CoreDataClass.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Meal)
public class Meal: NSManagedObject {

    var weight: Weight {
        set {
            weightString = newValue.stringValue
        }
        get {
            guard let weightString = weightString else {
                return Weight.light
            }
            return Weight(rawValue: weightString)
        }
    }

    var type: Type {
        set {
            typeString = newValue.stringValue
        }
        get {
            guard let typeString = typeString else {
                return Type.vegan
            }
            return Type(rawValue: typeString)
        }
    }

    var dateString: String {
        set {
            timestamp = Current.dateFormatter.date(from: newValue)
        }
        get {
            return Current.dateFormatter.string(from: timestamp!)
        }
    }

}
