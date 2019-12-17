//
//  CaloriesCount+CoreDataClass.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 17.12.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CaloriesCount)
public class CaloriesCount: NSManagedObject {
    func stringValue(weight: Weight) -> String {
        switch weight {
        case .light:
            return String(light)
        case .medium:
            return String(medium)
        case .heavy:
            return String(heavy)
        }
    }

    func intValue(weight: Weight) -> Int {
        switch weight {
        case .light:
            return Int(light)
        case .medium:
            return Int(medium)
        case .heavy:
            return Int(heavy)
        }
    }

    static func defaultValues(weight: Weight) -> Int16 {
        switch weight {
        case .light:
            return 200
        case .medium:
            return 500
        case .heavy:
            return 850
        }
    }

}
