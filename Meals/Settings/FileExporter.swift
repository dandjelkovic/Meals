//
//  FileExporter.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 05.11.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import Foundation
import RealmSwift

/// ------------------------------------
/// | timestamp l title | type | weight |
/// ------------------------------------

public struct FileExporter {
    private static let separator: Character = ";"

    func exportDatabase() -> URL? {
        do {
            let realm = try Realm()
            let objects = realm.objects(Meal.self)
            let csvList = objects.map { meal in
                "\(meal.datetimeString);\(meal.type.stringValue);\(meal.weight.stringValue)"
            }
            return writeToTempFile(string: csvList.joined(separator: "\n"))
        }
        catch {
            print("fetch task failed", error)
        }
        return nil
    }

    func writeToTempFile(string: String) -> URL? {
        let data = string.data(using: .utf8)
        let filePath = NSTemporaryDirectory().appending("Meals-export_\(Current.datetimeForBackup.string(from: Date())).csv")
        let fileURL = URL(fileURLWithPath: filePath, isDirectory: false)
        do {
            try data?.write(to: fileURL)
            return fileURL
        }
        catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
