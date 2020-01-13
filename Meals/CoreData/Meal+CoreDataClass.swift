//
//  Meal+CoreDataClass.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
//

// swiftlint:disable force_unwrapping
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

    var datetimeString: String {
        set {
            timestamp = Current.datetimeFormatter.date(from: newValue)
        }
        get {
            Current.datetimeFormatter.string(from: timestamp!)
        }
    }

    var timeString: String {
        set {
            timestamp = Current.timeFormatter.date(from: newValue)
        }
        get {
            Current.timeFormatter.string(from: timestamp!)
        }
    }

}
