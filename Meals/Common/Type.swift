//
//  Type.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 24.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
import SwiftUI

enum Type {
    case vegan, vegetarian, meat

    public var stringValue: String  {
        switch self {
        case .vegan:
            return "vegan"
        case .vegetarian:
            return "vegetarian"
        case .meat:
            return "meat"
        }
    }

    public var icon: some View {
        switch self {
        case .vegan:
            return Text("🌽")
        case .vegetarian:
            return Text("🥗")
        case .meat:
            return Text("🍖")
        }
    }

    public var color: Color  {
        switch self {
        case .meat:
            return Color(UIColor(named: "Weight heavy")!)
        case .vegetarian:
            return Color(UIColor(named: "Weight medium")!)
        case .vegan:
            return Color(UIColor(named: "Weight light")!)
        }
    }

    public init(rawValue: String) {
        switch rawValue {
        case "vegan":
            self = .vegan
        case "vegetarian":
            self = .vegetarian
        case "meat":
            self = .meat
        default:
            self = .vegan
        }
    }
}
