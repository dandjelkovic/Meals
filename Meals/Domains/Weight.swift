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

    public var image: Image {
        switch self {
        case .heavy:
//            return Image(systemName: "battery.100")
            return Image(systemName: "person.3")
        case .medium:
//            return Image(systemName: "battery.25")
            return Image(systemName: "person.2")
        case .light:
//            return Image(systemName: "battery.0")
            return Image(systemName: "person")
        }
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

