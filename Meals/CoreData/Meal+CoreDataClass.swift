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
        get {
            guard let weightString = weightString else {
                return Weight.light
            }
            return Weight(rawValue: weightString)
        }
        set {
            weightString = newValue.stringValue
        }
    }

    var type: Type {
        get {
            guard let typeString = typeString else {
                return Type.vegan
            }
            return Type(rawValue: typeString)
        }
        set {
            typeString = newValue.stringValue
        }
    }

    var datetimeString: String {
        get {
            Current.datetimeFormatter.string(from: timestamp!)
        }
        set {
            timestamp = Current.datetimeFormatter.date(from: newValue)
        }
    }

    var timeString: String {
        get {
            Current.timeFormatter.string(from: timestamp!)
        }
        set {
            timestamp = Current.timeFormatter.date(from: newValue)
        }
    }

}
