//
//  World.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation
import WatchConnectivity

public struct World {
    var date = { Date() }
    var datetimeFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter
    }

    var datetimeForBackup: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy_HHmmss"
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter
    }

    var timeFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter
    }
    var deviceIsWatch: Bool {
        #if os(watchOS)
        return true
        #else
        return false
        #endif
    }

    var deviceIs_iOS: Bool { // swiftlint:disable:this identifier_name
        #if os(iOS)
        return true
        #else
        return false
        #endif
    }
}

#if DEBUG
// swiftlint:disable identifier_name
public var Current = World()
#else
public let Current = World()
#endif
