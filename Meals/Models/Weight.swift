//
//  Weight.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
import SwiftUI
import CoreData
import UIKit

public enum Weight: String, CaseIterable {
    case light, medium, heavy

    public var stringValue: String {
        switch self {
        case .heavy:
            return "Heavy meal"
        case .medium:
            return "Normal meal"
        case .light:
            return "Light meal"
        }
    }

    public var intValue: Int {
        switch self {
        case .heavy:
            return 3
        case .medium:
            return 2
        case .light:
            return 1
        }
    }

    public var image: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(1...self.intValue, id: \.self) {_ in
                Text("🍽")
            }
        }.frame(width: 80, alignment: .center)
    }

    public func caloriesCount(context: NSManagedObjectContext) -> Int {
        let request = NSFetchRequest<CaloriesCount>(entityName: "CaloriesCount")

        do {
            let objects = try context.fetch(request)
            if objects.isEmpty {
                let defaultEntry = CaloriesCount(context: context)
                defaultEntry.light = CaloriesCount.defaultValues(weight: .light)
                defaultEntry.medium = CaloriesCount.defaultValues(weight: .medium)
                defaultEntry.heavy = CaloriesCount.defaultValues(weight: .heavy)
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                return Int(CaloriesCount.defaultValues(weight: self))
            }
            return objects[0].intValue(weight: self)
        } catch {
            print(error.localizedDescription)
        }
        return 0
    }

    public init(rawValue: String) {
        switch rawValue {
        case "Heavy meal", "Schwere Mahlzeit":
            self = .heavy
        case "Normal meal", "Mittlere Mahlzeit":
            self = .medium
        case "Light meal", "Leichte Mahlzeit":
            self = .light
        default:
            self = .light
        }
    }
}
