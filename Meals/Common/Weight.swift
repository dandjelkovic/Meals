//
//  Weight.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
import SwiftUI

enum Weight: String {
    case light, medium, heavy

    public var stringValue: String  {
        switch self {
        case .heavy:
            return "Heavy meal"
        case .medium:
            return "Normal meal"
        case .light:
            return "Light meal"
        }
    }

    public var intValue: Int  {
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
        return
            HStack(alignment: .center, spacing: 0) {
                ForEach(1...self.intValue, id: \.self) {_ in
                    Text("🍽")
                }
            }.frame(width: 80, alignment: .center)
    }
    
    public var calories: ClosedRange<Int> {
        switch self {
        case .heavy:
            return 650...1000
         case .medium:
            return 300...650
         case .light:
            return 200...300
         }
    }
    
    public var minCalories: Int {
        return calories.min() ?? 0
    }
    
    public var maxCalories: Int {
        return calories.max() ?? 0
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

