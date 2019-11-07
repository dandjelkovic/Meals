//
//  World.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 21.10.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation
import RealmSwift

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

    func setupSyncedRealm(completion: @escaping (Realm) -> Void) {
        let serverURL = URL(string: "https://synergized-frozen-tuna.de1a.cloud.realm.io/")!
        let realmURL = URL(string: "realms://synergized-frozen-tuna.de1a.cloud.realm.io/~/realmtasks")!
        let credentials = ("meals", "neix5feivegah7Ae")

        SyncUser.logIn(with: .usernamePassword(username: credentials.0, password: credentials.1), server: serverURL) { (user, error) in
            guard user != nil else {
                fatalError(String(describing: error))
            }
            let configuration = SyncUser.current!.configuration(realmURL: realmURL, fullSynchronization: false, enableSSLValidation: true, urlPrefix: nil)
            completion(try! Realm(configuration: configuration))
        }
    }
}

#if DEBUG
//swiftlint:disable identifier_name
public var Current = World()
#else
public let Current = World()
#endif
