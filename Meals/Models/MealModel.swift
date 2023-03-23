//
//  MealModel.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 23.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//
import Foundation

struct MealModel {
    var weight: Weight
    var type: MealType
    var timestamp = Current.date()

    func toDict() -> [String: Any] {
        [
            "weight": weight.stringValue,
            "type": type.stringValue
        ]
    }

    static func fromDict(dict: [AnyHashable: Any]) -> MealModel {
        return MealModel(
            weight: Weight(rawValue: dict["weight"] as! String), // swiftlint:disable:this force_cast
            type: MealType(rawValue: dict["type"] as! String) // swiftlint:disable:this force_cast
        )
    }
}
