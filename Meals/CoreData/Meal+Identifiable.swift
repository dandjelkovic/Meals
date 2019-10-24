//
//  Meal+Identifiable.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 24.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

extension Meal: Identifiable {
    public var id: String {
        return self.objectID.uriRepresentation().absoluteString
    }
}
