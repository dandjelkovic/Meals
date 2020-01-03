//
//  Meal+CoreDataProperties.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 24.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
//

import Foundation
import CoreData

extension Meal {

    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var weightString: String?
    @NSManaged public var typeString: String?

}
