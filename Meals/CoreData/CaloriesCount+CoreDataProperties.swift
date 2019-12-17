//
//  CaloriesCount+CoreDataProperties.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 17.12.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//
//

import Foundation
import CoreData

extension CaloriesCount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CaloriesCount> {
        return NSFetchRequest<CaloriesCount>(entityName: "CaloriesCount")
    }

    @NSManaged public var light: Int16
    @NSManaged public var medium: Int16
    @NSManaged public var heavy: Int16

}
