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
            return "vegetarisch"
        case .meat:
            return "fleisch"
        }
    }

//    public var image: Image {
//        switch self {
//        case .vegan:
//            //            return Image(systemName: "battery.100")
//            return Image(systemName: "person.3")
//        case .vegetarian:
//            //            return Image(systemName: "battery.25")
//            return Image(systemName: "person.2")
//        case .meat:
//            //            return Image(systemName: "battery.0")
//            return Image(systemName: "hare")
//        }
//    }

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
