//
//  Meal+Identifiable.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 24.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation

extension Meal: Identifiable {
    public var id: String {
        return ProcessInfo().globallyUniqueString
    }
}
