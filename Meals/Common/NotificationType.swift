//
//  NotificationType.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 24.03.23.
//  Copyright © 2023 Dalibor Andjelkovic. All rights reserved.
//

import Foundation

enum NotificationType: String {
    case receiveNewMeal

    var notification: NSNotification.Name {
        switch self {
        case .receiveNewMeal:
            return NSNotification.Name(rawValue: self.rawValue)
        }
    }
}
