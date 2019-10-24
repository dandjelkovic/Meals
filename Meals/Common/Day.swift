//
//  Day.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 22.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation

public struct Day: Hashable {
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter
    }
    var date: Date
    var dateString: String {
        dateFormatter.string(from: date)
    }
    var weekday: (Int, String) {
        let weekdayCount = Calendar.current.component(.weekday, from: self.date)
        let weekdayName = Current.dateFormatter.weekdaySymbols[weekdayCount]
        //TODO: weekday is shifted by one
        return (weekdayCount, weekdayName)
    }
    var meals: [Meal]
}
