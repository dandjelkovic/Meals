//
//  World.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation

public struct World {
    var date = { Date() }
    var datetimeFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter
    }

    var timeFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter
    }
}

#if DEBUG
//swiftlint:disable identifier_name
public var Current = World()
#else
public let Current = World()
#endif
