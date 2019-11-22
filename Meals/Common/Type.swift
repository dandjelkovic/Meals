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

    public var icon: Image {
        switch self {
        case .vegan:
            return Image("icons8-veganes-essen-64")
        case .vegetarian:
            return Image("icons8-vegetarian-64")
        case .meat:
            return Image("icons8-hamburger-64")
        }
    }

    public func iconScaledBy(count: Int) -> some View {
        let length = iconLengthFor(count: count)
        switch self {
        case .vegan:
            return icon.resizable().frame(width: length, height: length)
        case .vegetarian:
            return icon.resizable().frame(width: length, height: length)
        case .meat:
            return icon.resizable().frame(width: length, height: length)
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

    private func iconLengthFor(count: Int) -> CGFloat {
        guard count != 0 else {
            return 0
        }
        switch count {
        case 1:
            return 20
        case 2:
            return 30
        default:
            return 40
        }
    }
}
