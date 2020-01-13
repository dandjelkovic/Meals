//
//  FileExporter.swift
//  Meals
//
//  Created by Dalibor Andjelkovic on 05.11.19.
//  Copyright © 2019 Dalibor Andjelkovic. All rights reserved.
//

import UIKit
import Foundation
import CoreData

/// ------------------------------------
/// | timestamp | title | type | weight |
/// ------------------------------------

public struct FileExporter {
    private static let separator: Character = ";"
    // swiftlint:disable:next force_cast
    private let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    static func convert(input: String, CSV: String) {
        var rows = input.split(separator: "\n").map { String($0) }
        let content = rows
        content.forEach { line in
            print(line.split(separator: separator))
        }
    }

    func exportDatabase() -> URL? {
        do {
            let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            let csvList = fetchedResults.map { meal in
                "\(meal.datetimeString);\(meal.type.stringValue);\(meal.weight.stringValue)"
            }
            return writeToTempFile(string: csvList.joined(separator: "\n"))
        } catch {
            print("fetch task failed", error)
        }
        return nil
    }

    func writeToTempFile(string: String) -> URL? {
        let data = string.data(using: .utf8)
        let filePath = NSTemporaryDirectory()
            .appending(
                "Meals-export_\(Current.datetimeForBackup.string(from: Date())).csv"
        )
        let fileURL = URL(fileURLWithPath: filePath, isDirectory: false)
        do {
            try data?.write(to: fileURL)
            return fileURL
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
