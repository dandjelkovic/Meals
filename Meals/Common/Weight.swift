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
            return "Schwere Mahlzeit"
        case .medium:
            return "Mittlere Mahlzeit"
        case .light:
            return "Leichte Mahlzeit"
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

    public var shortStringValue: String  {
        switch self {
        case .heavy:
            return "Schwer"
        case .medium:
            return "Mittel"
        case .light:
            return "Leicht"
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

    public var color: Color  {
        return Color(UIColor.label)
//        switch self {
//        case .heavy:
//            return Color(UIColor(named: "Weight heavy")!)
//        case .medium:
//            return Color(UIColor(named: "Weight medium")!)
//        case .light:
//            return Color(UIColor(named: "Weight light")!)
//        }
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
        case "Schwere Mahlzeit":
            self = .heavy
        case "Mittlere Mahlzeit":
            self = .medium
        case "Leichte Mahlzeit":
            self = .light
        default:
            self = .light
        }
    }
}

