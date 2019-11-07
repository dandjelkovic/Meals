//
//  Meal.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
//

import Foundation
import RealmSwift

public final class Meal: Object {

    @objc dynamic var weightString: String? = nil
    @objc dynamic var typeString: String? = nil
    @objc dynamic var timestamp = Date()

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
            timestamp = Current.datetimeFormatter.date(from: newValue)!
        }
        get {
            return Current.datetimeFormatter.string(from: timestamp)
        }
    }
    var timeString: String {
        set {
            timestamp = Current.timeFormatter.date(from: newValue)!
        }
        get {
            return Current.timeFormatter.string(from: timestamp)
        }
    }

}
